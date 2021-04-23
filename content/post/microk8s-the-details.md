---
title: The Gory Details
subtitle: To microk8s, or not to microk8s
date: 2019-02-08
tags: ["technical", "mickrok8s", "Kubernetes", "Alibaba Cloud"]
---

This is Part 2 of a mini-series of my experiences getting Transcrobes migrated from separate server apps on a 4gig Alibaba Cloud VM to microk8s on the same VM, and automating (almost) everything with Gitlab CI.

Check out [Part 1 here](/post/single-user-prod-microk8s)

# Some Detailed Gripes and Gotchas

## Building Snaps

I had seen a couple of talks on service meshes at a conference a while back but hadn't had a play yet - microk8s ships with [istio](https://istio.io), and istio is all the rage these days (apparently), so I definitely wanted to use that in the system. It would also get me detailed metrics via Prometheus integration for free - I definitely wanted me some o' dat. Unfortunately, the version of istio that (still) ships with microk8s is broken. The [actual bug](https://github.com/istio/istio/issues/6962) was fixed long ago but microk8s hasn't updated - I spent many hours trying to rebuild the snap before deciding to give up and [create an issue](https://github.com/ubuntu/microk8s/issues/230) (with no associated PR :-( ). One of the major issues was bandwidth - back in France I had unlimited 1Gb fibre, here I have 40GB of 4G, then 60GB of 3G before it drops down to 2G. Building snaps means you download everything. Then when it doesn't work you download it again, and again, and again... There [is a bug](https://bugs.launchpad.net/snapcraft/+bug/1582469) for that... When you are downloading over wireless, on a VPN that regularly broke in the middle of big files, the language can get colourful :-).

The other issue is that the Ubuntu folks only seem to test stuff on 16.04, and I was using 18.04. I couldn't get the snap to build on 18.04, either directly on my laptop or in a VM. After several VM installs and reinstalls (with a 16.04), including with and without `cleanbuild`. `cleanbuild` does it's stuff in an `lxd` container... which also adds networking complexity to the mix...

The Ubuntu folks, and particularly [ktsakalozos](https://github.com/ktsakalozos), were helpful but I ended up abandoning trying to build it myself. [ktsakalozos' PR](https://github.com/ubuntu/microk8s/pull/239) hasn't passed Travis yet either though, so maybe it was for the better.

I have since decided that I'll have to leave istio till later. In addition to the added complexity, particularly for stuff like automated SSL provisioning with [cert-manager](https://github.com/jetstack/cert-manager), it adds a ton of extra (side-car) containers and I was already approaching the hard 4GB-limit on RAM that I have with the Alibaba VM, not to mention the laptop.

## Bloat

That gets me to one of the question marks I have about microk8s - there is a lot of stuff in there that doesn't really need to be there. It *sounds* good, until you actually start developing stuff. If you are going to actually use istio, then you are definitely capable of installing it into a cluster. When you have old, broken versions included and it is just as easy to install either from source or via Helm, the value add looks a little light. One additional issue is that microk8s basically just does a grep for the name for the service management, and even if you aren't using the bundled istio, a `microk8s.disable istio` is still going to to kill your manually installed istio. I think there is an argument for having kube-dns - though that's now deprecated in favour of coredns - but I would get rid of most of the other bundled apps. They add complexity and when you want to push a bit, they end up just getting in the way. I am a huge fan of Helm - but I wouldn't even include that. If you are going to actually use microk8s, even just for playing around, then you are installing stuff the same way you can install the included stuff.


## `sudo iptables -P FORWARD ACCEPT`

As mentioned above, microk8s does some serious stuff to the networking. While there are [plenty of bug reports](https://github.com/ubuntu/microk8s/search?q=forward&type=Issues) on the issue that have been there for months, there is still no solution for the dreaded "FORWARD ACCEPT" bug. Basically, you need iptables to forward packets for anything relating to DNS to work (and plenty of other stuff too). Ever had weird, hard-to-diagnose stuff that "can't possibly be DNS"? After much frustration you then find out it is, indeed, DNS and then you spend even more time before realising that you haven't executed `sudo iptables -P FORWARD ACCEPT` since your last reboot. It's mentioned in various places in the docs but when you regularly have to reboot then not having it happen automatically is a royal PITA.

The issue about fixing it myself with a temp hack is that microk8s does lots of complicated stuff with the networking, and there is a decidedly non-negligible chance that my hack will get broken with the next microk8s update. It really needs to get fixed upstream, and apparently that is complicated. I did a bit of iptables stuff back in the day, but that back in the day is almost 8 years ago now and the reason I am developing this system at all is because my memory is not what it used to be! When the rest of the project gets a bit more mature then I'll definitely try and get this fixed upstream (if it's not already fixed by then).

## `kube-proxy`

microk8s uses `userspace` kube-proxy mode by default. Basically you just have an additional (Go) layer inserted into the proxy stack that allows for better debugging and some other stuff. This was added mainly due to a bug that doesn't appear unless you're on Azure. The issue? For low-volume testing, performace is virtually indistinguishable from the default (iptables) mode but once you up the QPS then performance degrades *BY AT LEAST 4x*. It is easy enough to turn off, if you know what you are looking for, but when everything is new, finding out what to look for can take a *significant* amount of time!

There is currently a [`WIP` PR](https://github.com/ubuntu/microk8s/pull/145) on Github that will detect the platform and only use `userspace` on Azure. I think this is a good example of where there is no really good default though - for laptop testing `userspace` is probably the best default - for anything else it is unnecessary and a pain. microk8s is first and foremost for testing on your laptop though...

## Coming up
In spite of a few bugs and a number of gotchas, I still think microk8s is great and will definitely continue using it. In the next installment I review the problematic aspects of migrating apps not intended for the cloud to Kubernetes.
