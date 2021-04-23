---
title: Migrating to Kubernetes
subtitle: A square peg in a roundish hole
date: 2019-02-17
tags: ["technical", "mickrok8s", "Kubernetes", "Alibaba Cloud"]
---

This is Part 3 of a mini-series of my experiences getting Transcrobes migrated from separate server apps on a 4gig Alibaba Cloud VM to microk8s on the same VM, and automating (almost) everything with Gitlab CI.

Check out [Part 1 here](/post/single-user-prod-microk8s) and [Part 2 here](/post/microk8s-the-details).

# Kubernetes Migration Woes

## nginx-ingress

I was coming from a setup where I knew the component parts (Apache + mod\_wsgi) pretty well. I haven't been working on high-load web stuff for over 8 years now, and always thought that `nginx` was a lot of hype for not much benefit. After all, if you know how to configure Apache properly, you can make it purr like a kitten under high load :-). `nginx-ingress` is the default ingress for Kubernetes though, and I didn't much fancy having to try to do the stuff I needed to (cert-manager, basic auth at ingress, proxying two web apps) with some random, poorly supported Apache-based controller (if it even exists).

My own personal learning database had also evolved quite a bit - I started from basically nothing so when I started development and had to do full Anki database syncs, they were pretty small. Now the DB is approaching 10MB. So the sync operation was failing miserably, and I was at a loss to understand why... Obviously I eventually encountered the default max-file-size limit of nginx - 1MB. I spent quite a bit of time after that looking through the nginx docs for other default options that were likely to bite me sooner or later, and updated accordingly for the different applications.

## Liveness and Readiness Probe Defaults
The defaults for the liveness and readiness probes are pretty appropriate for well-designed "Cloud-native" apps. I am doing some highly unoptimised processing, loading large datafiles into memory on startup and transferring large user data binaries (sqlite dbs) between server and user on home-build threading (for [ankisyncd](https://github.com/tsudoko/anki-sync-server). The defaults for liveness and readiness assume that apps are going to be available if they are healthy, and all the server modules (currently!) can go up to a minute without responding because they are busy doing stuff. In the Apache+mod\_wsgi world with no checks, everything Just Worked TM, albeit rather slowly. For the most part that wasn't an issue for me as a single user before - now I was getting my main modules killed whenever I actually started using it.

I spent quite a long time trying to get values that weren't going to kill my modules when they were hard at work but would also restart them within a reasonable period of time when they are actually unhealthy. As I'm the only user for the moment, I just pushed the values up and up but even then the system would eventually start killing pods. Because the VM it's running on is close to the limit in terms of memory, and Kubernetes (by default) starts spinning up a new instance while the old one is still around, losing a couple of pods meant starting to hit swap, and hitting swap meant everything would go down. I eventually decided to put of this battle to another day, and completely disabled liveness and readiness checks. This will definitely need to be revised when someone starts having multiple users on the system. It does also bring into focus the fact that quite a few parts were *horribly* designed for working under load...

## Bad Design Laid Bare

I started this whole project out not knowing whether it would be possible to do at all. I didn't know whether the NLP text parsing and analysis stuff was available or whether there would be sufficient dictionary resources.

The "Big Win" for the project would be getting any webpage enriched via a browser plugin. Now I have always *HATED* javascript, and even when I was working on large, complex web projects, I was usually able to flick that stuff off to team mates. I had no idea how to develop a browser plugin - since I was last forced to work on javascript they have even changed the name to web extensions! I had worked with jQuery a bit back in the day and definitely didn't want to go through learning an entire new framework, even if jQuery is now very long in the tooth - besides, whatever I chose I was going to *HATE* it, so the less time spent on it the better.

But with some very, very long days, I was able to hack something together that I could actually use in about three weeks (including discovering NLP and machine translation). It was a *monumental* hack though, and was about as stable as quicksand. The javascript is *embarassingly* spaghetti and inefficient.

I simply assumed everything would be rewritten if the idea turned out to be feasible, so didn't worry about any of the normal design or coding practices. But haven't we all said that at least once and lived to regret it? Time goes on and you find yourself wanting to actually start pushing releases out (because the boss demands it), or you want to open source something to finally get some help, and you say to yourself - how could I possibly have created such a monstrosity?!?!? I know better than to ever build stuff like this!!!!! But it "works", and there is so much else to do that a complete rewrite *now* would just put you back another 2, 4, 8, X weeks... So if you package it up so no one looks too close, you can probably get by putting off the rewrite for another couple of months...

Migrating to Kubernetes and wanting to get to a point where an admin wasn't manually doing lots of stuff every time *anything* needed to be done, turned out to not just be the "packaging it up so people don't look too hard" I'd hoped for. The Anki-compatible server implementation I was using uses sqlite3 db files for storing user data and credentials - it is basically a normal installation of Anki with a hack on top make a copy synchronisable on the web. I had added a light API into this to access the user data outside the normal sync workflow. Just for syncing, it works well enough - when each user has a single database and they only perform very infrequent syncs, sqlite works great and moving to anything else is arguably overkill.

But I was querying the API up to several *thousand* times *for every webpage* a user visits (and transcrobes)... The main app was querying the API using hard-coded credentials for the system's only user - me. I could hardly open source that and let anyone try and use it... So I developed a user manager that would query the main system for credentials - a query comes in from the outside world with basic auth, the main system then passes that on to the Anki server, which then calls back to the main API to validate the credentials :=).

The issue is that the Anki server still has to perform syncs via the normal sync API to the outside world, so not going through the main API. Needless to say, it didn't stand up to anything like the load even a single user puts on the system. I could have implemented a user manager that hit the Postgres database directly but that would only have solved half the problem - I had attempted a short credentials cache that largely took the auth part out of the equation but the system still fell flat under normal, single user load. The added complexities of inter-container communication and the "Cloud Native" defaults of the main Kubernetes components, added to the fact that I was doing all this on a not-for-production, highly memory constrained kube-in-a-box meant my hacks were falling apart - badly.

It's then when you are simply obliged to put your proper "design" hat on and think about the best way to do it. Over time the two systems are going to be more and more coupled, and having the user data directly available in a common, network data store was a defensible option, even if possibly not fully Cloud Native. The only viable option I saw short of reimplementing and maintaining a completely independent digital flashcard system and sync server, was implementing Postgres support for ankisyncd. That would also mean I could keep the user data in a single, stable place - microk8s does pretty well with the dynamic storage layer but needing to have a StatefulSet for the Anki sync server was already a Bad Idea TM.

I gave myself a day to poke around see what came up, and another day when things looked promosing by the end of the first. A week or so later I had replaced my horribly inefficient API implementation with an [ankisyncd Postgres compatibility layer](https://gitlab.com/transcrobes/pg-ankisyncd). One of the advantages of doing it this way was that I could literally copy/paste my existing API code from my hack on ankisyncd back into Transcrobes Core, with basically only one change - the main regex-based SQL query for getting a word from the DB. The class that was there for interacting with the ankisyncd API became the class that accessed the DB in Transcrobes Core, using the stuff developed for the Postgres compatiblity layer in pg-ankisyncd. Needless to say, performance was unrecognisably better!

It certainly ain't pretty but it means that it is decoupled from the main ankisyncd, which can change and evolve (hopefully) without me having to update my code every time upstream Anki changes how the clients expect the official sync API to behave. I can simply update my dependency and (hopefully) only have a tweak or two to do every few updates.

To this I added a laughably simple DjangoUserManager, and with a few lines of code had a user manager validating from the main DB for the syncing in ankisyncd.

There is still a huge amount of work to do but I'm now at a better place in terms of performance and, at least in theory, I could spin up multiple replicas for all services but the DB. If only I had more memory to play with...

So I could now finally get back to writing the server install and deployment documentation I had already promised a few people would be ready "in a day or two" :-).

## Coming up
Migrating stuff to a new platform is always a great opportunity to have a bit of a spring clean, and migrating Transcrobes to Kubernetes was an amazing learning experience. That will no doubt continue for a long time to come! Up next I go over the automation that has been set up for the build and CI on Gitlab.
