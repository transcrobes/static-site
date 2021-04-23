---
title: Single-User Production on Microk8s
subtitle: Never Say Never
date: 2019-02-05
tags: ["technical", "mickrok8s", "Kubernetes", "Alibaba Cloud"]
---

This is Part 1 of a mini-series of my experiences getting Transcrobes migrated from separate server apps on a 4gig Alibaba Cloud VM to microk8s on the same VM, and automating (almost) everything with Gitlab CI.

# Introduction

Microk8s is a kube-in-a-box distribution sponsored by Ubuntu, and in this blog post I recount my experiences getting my own personal [Transcrobes](https://transcrob.es) installation migrated to a [Kubernetes Helm](https://helm.sh) [chart](https://gitlab.com/transcrobes/charts/) and running on it on a 4GB VM on Alibaba Cloud in China.

# What is Transcrobes?

## In a nutshell
Transcrobes is a new way for people to interact with content in a language that is not their strongest. The basic idea is that you have a content consumption application (web browser, e-book reader, video client, email client, etc.) which has a textual representation in a language you regularly interact with, but is not your strongest. Transcrobes adds personalised comprehension aids in-place so you get to read in the language without having to perform a lookup for the words you don't know. Say you are French but regularly have to read reports in English, and there are still lots of words you have to look up to understand properly. Transcrobes fixes that by enriching the text with inline translations (glosses) for just the words you don't know. You can find out more on the [rest of the site](https://transcrob.es).

I took a year off work to learn Chinese, and I thought of the system so I could learn Chinese by reading and watching stuff I was actually interested in, rather than the insanely boring textbooks I am using.

## The System

Transcrobes (currently) has:

### Server

- [CoreNLP](https://stanfordnlp.github.io/CoreNLP/) with the Chinese language pack - ~1GB RAM
- An [Anki-compatible](https://gitlab.com/transcrobes/ankrobes-server) server (based on [ankisyncd](https://github.com/tsudoko/anki-sync-server) but with Postgres as the data store for user data) - ~100MB RAM, up to about 500MB
- [Transcrobes Core](https://gitlab.com/transcrobes/transcrobes), a service that accepts blocks of text, gets `CoreNLP` to parse them, gets the known words from ankisyncd and then uses dictionaries (in-mem and external) and machine translation (external) to find the best translations for the unknown words and sends it back - ~700MB RAM up to ~1GB
- [A Helm chart](https://gitlab.com/transcrobes/charts/)

### Clients

- Two Firefox extensions ([here](https://gitlab.com/transcrobes/brocrobes/) and [here](https://gitlab.com/transcrobes/notrobes/)) that use the API - one for enriching any webpage at the click of a button, another for looking up arbitrary words simultaneously in (currently) 4 dictionaries, and then being able to add that to the learning/known words database with a click.
- [Anki Desktop](https://github.com/dae/anki) (with an Addon) and [Ankidroid](https://github.com/ankidroid/Anki-Android/)

## Why Kubernetes? Why microk8s?

Transcrobes has 3 pretty heavyweight services + a Postgres DB. CoreNLP runs on Java, ankisyncd on a basically hand-crafted Python web framework, and Transcrobes Core is (currently) Django. Manually installing that on one or more servers would be a *real* pain, and trying to support it a monumental task. Kubernetes is pretty much perfect for this sort of thing, at least it would be if you didn't have to spend big money to run it for a small-scale setup. If the project takes off then it will need to scale, and I would like that to be possible by simply increasing the number of replicas, rather than realising the system needs to be completely re-architected. I'm also a SRE/DevOps by trade but hadn't worked with Kubernetes before, so it was a great opportunity to get some "production" experience with it.

One goal of the project is to provide a platform for language learning researchers to quickly and easily set up experiments to test various aspects of the learning process. While it will always require a certain level of technical acumen, getting all those services (and there are more to come!) individually set up and accessible from the web would be a non-starter for many. Kubernetes has the almost magical [Helm package manager](https://github.com/helm/helm) which would allow interested users/learners/researchers/teachers to set up the system in a few commands, provided they have a Kubernetes cluster to install it on. Cloud accounts require a credit card, and many organisations, particularly educational organisations, won't just give credit cards out for someone to test a new thing they saw in a blogpost.

## Microk8s to the Rescue!
I went out looking and quickly found there were two major contenders in the kube-on-your-laptop space - Minikube and Microk8s. Minikube was in a virtual environment and was definitely development workstation-only from what I could tell. Microk8s could be run directly on my laptop, didn't require a VM (more on that later...) and I could easily install and run it on the Alibaba VM I had prepaid for a year to run my personal install of Transcrobes. And the name is cool. If I only could get it to work...

## But you should never use microk8s for production!

Well, why not? If getting a Cloud account and paying lots is not an option but you have a VM you can use - it might just do the trick! This use-case - complicated setup, 1-3 users with relatively low utilisation and a reasonably high tolerance for patchy service - seems like a perfect fit to me, particularly if one of the users is you :-).

## Development Setup
I'm currently living in student accomodation in a small town in Yunnan, China. They had wired internet at one point but abandoned it. The cheap campus wifi is totally unusable, even if I hold my phone/laptop out on the balcony, so I am using my old Nexus 6P as a 4G wifi router.

Kubernetes has great resources for learning, if you can get to them. Google hosts a lot of those resources, and the GFW of China doesn't like Google. So I needed a VPN on my 8gig laptop. I would have put it on my 6P but someone at Google decided that while wifi sharing is Ok, sharing the VPN over wifi is not. Only having 8gig and having the VPN on the laptop turned out to be the two major pain points with microk8s.

## The Good, the Bad and the Networking
As some helpful fellows on the #kubernetes-novice slack channel pointed out, microk8s needs to do some pretty intrusive stuff with the network. If you don't look at it too hard, it might not break. If you have a VPN that you regularly need to turn on and off (for getting at China-only stuff) and wifi that regularly needs to be turned on and off (bug with the Nexus), then your IP tables suffer. And then you have systemd-resolved that gets confused with the DNS, and then you get Chrome which loses the plot completely (weird DNS caching issues). How long does one spend trying to resolve a DNS issue - that might happen again the next time the wifi cuts out - before giving up and rebooting? Rebooting the laptop is relatively quick but even with [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect), getting the dev environment back is not instantaneous.

The VPN I was using also had *serious* issues getting around the GFW. It would regularly go down and then not be available for several hours. In addition to not having Google to search with, many things (like all the Google hosted base container images) are completely inaccessible without one. Then you have [the issue installing `snaps` from China](https://bugs.launchpad.net/snapstore/+bug/1767118) - you can but it is *insanely* slow.

After wasting in total probably 1-2 weeks of time I should have been coding fluffing around with the networking issues related to VPN and wifi, I finally bit the bullet and rooted my Nexus 6P so I could have wifi sharing of the VPN, and got another VPN subscription - ExpressVPN. It is working much, much better now. I can go a couple of days without having a serious outage now. I would have done it sooner if I had known what the solution was - when you need to spend serious time on a solution that *might* be better, you tend to put it off as long as possible!


## Multi-node clustering software on a single flakey node
We've seen why the networking was a headache - regular reboots - but what about only having 8gig of RAM? At my last job my laptop was only for web browsing and a terminal. I had a desktop in the office with 32gig of RAM and plenty of preprod servers with 192-256gig to play with. I do all my dev work in VIM, and with fibre and a 32gig desktop in the office, I did all of my dev from my laptop over SSH (including when I was at work). When you are learning new stuff as you go along, you tend to open up a certain number of tabs. Chrome is a memory hog at the best of times - when you have a VM that is taking up half of your RAM, and Chrome that is taking the other half, things start to go wrong. Things would be running along nicely, I'd open up a new tab to look for something new, the cursor starts slowing down and the fan goes on... ARGH! Losing a tab or two would be fine but far too regularly it was the VM that was chosen by the OS for the chopping block.

Until very recently, microk8s was still using a totally ancient version of Docker, a version with a bug that would bork a log file on hard restarts and then need to be cleaned before Docker would start again. That took a looong time to find.

Hard resets on a single-node `etcd` cluster? Yep... at some point it's gonna get foobarred. I have only had this a couple of times but when etcd fails to start then obviously Kubernetes is not going to work very well. The problem is that the tools that microk8s provides for cleaning a cluster rely at least on the Kubernetes API Server being available, and when etcd is down, you don't got diddly. I haven't used etcd before (we used consul at my last job) and didn't want to have to diagnose issues with a half-fixed cluster. I ended up completely reinstalling microk8s to get things cleaned up properly a couple of times.

## Coming up
So there are a few of the issues I faced during my migration - on a laptop in China. In the next installment I take a closer look at some of the things that made microk8s itself a pain to use.
