---
title: Gitlab All The Things
subtitle: When all you have is a magical hammer...
date: 2019-02-21
tags: ["technical", "Gitlab", "CI", "DevOps"]
---

This is Part 4 of a mini-series of my experiences getting Transcrobes migrated from separate server apps on a 4gig Alibaba Cloud VM to microk8s on the same VM, and automating (almost) everything with Gitlab CI.

Check out [Part 1 here](/post/single-user-prod-microk8s), [Part 2 here](/post/microk8s-the-details) and [Part 3 here](/post/migrating-to-kube)

# Gitlab all the Things

## Automating container builds

In the middle of writing the server install documentation, I realised that I had just been manually building and pushing the images to Gitlab's image registry. I had already had to make several changes both the Transcrobes Core and Ankrobes (Anki) server implementations. Manually building and pushing is both annoying, and takes up my precious bandwidth. Everything was going to be automated at some point anyway, and if I started talking about the project to engineers (who might be interested enough to lend a hand) then people are going to want to see how it gets built. "In a VM on my laptop" just wasn't going to cut it - I'm an SRE/DevOps by trade, after all! I had also made that famous mistake of having plenty of cruft in my development directory, and not having a .dockerignore file - yes, I (briefly) made images available with all my credentials :-). It needed to get automated and built directly from git, without the family jewels...

## Automate all the things - Gitlab CI

This blog is generated and automatically deployed onto Gitlab pages with a custom domain with Gitlab CI. The Kubernetes Helm chart repo is generated and deployed onto Gitlab pages with a custom domain with Gitlab CI. Both sites' SSL certs are provisioned and updated automatically with Gitlab CI. The container images are built and released to the Gitlab registry (and also Dockerhub because of China's GFW) automatically with Gitlab CI. The web extensions are built and deployed automatically to this (static) Gitlab pages site with Gitlab CI.

At my last job I had put forward a proposal to implement a green-field PAAS project using Gitlab and Kubernetes - it was rejected at the time for organisational reasons. I was the boss of this open source project though, so could do what I liked. Now I have some actual experience setting up a reasonably complex system on Gitlab I can say with certainty that GITLAB IS TOTALLY AWESOME! Honestly, why anyone would bother with the nastiness that is Travis when you have unlimited *PRIVATE* repos with 1200 free CI build mins per month (per namespace, meaning if you test everything on your fork first you get 1200 mins extra per dev per month) in a fully integrated environment on Gitlab is totally beyond me. Jenkins is just plain horrible - unstable, buggy, user-unfriendly and lacking in features without 3000 plugins, that make it even more buggy and unstable. And for the record - I have absolutely *no* affiliation with Gitlab. I even applied for a job there and didn't get very far, it seems their awesomeness is just too great for little ol' me!

I will confess some things I did find quite hard to find. Google has a very annoying tendency to return results for Github when you search for Gitlab even though, in terms of functionality, Github is a mere lightweight compared with the Mighty Gitlab. Other times my Google-foo just wasn't up to scratch - the info is all there but unless you set aside a couple of days to go through the entire API, it can be a little difficult to find when you don't really know what you are looking for. I have only scratched the surface with what is possible and as time goes on, Transcrobes will become more automated and more Gitlab-centric. What I eventually want to happen is that someone wanting to deploy a development-centred Transcrobes install (so a team of researchers/coders) can simply clone the group, put in GCP credentials and have a fully independent (and private if they want) dev-to-prod setup

## Packaging up the clients

As I finally got to the end of the server install documentation, I got to the "congratulations, now you can move on to installing the clients" part, and realised that all I had were a couple of READMEs with "these extensions aren't signed, so you'll have to build and install yourself". If the reader were anything like myself, I would have shouted obscenities and abandoned the setup - no matter how cool something *sounds*, if I had to learn about web extensions so I could build and install (an unsigned) one manually, I would not have been impressed. So not only would I have to build them and make them available, I would have to document doing it or automate the build process. Automating needed to get done anyway, and automating is definitely something I *like* doing :-). So I decided to take some time to automate build and deploy and then document.

I couldn't find an easy and clean way to release to Gitlab releases. There are some pretty new APIs there (including some that were only released last month, like Release Links, and others to come this month), and you have to use the API to do the really advanced stuff. They will no doubt integrate easy and nice ways of doing it via CI features soon but for the moment I just hackily push to a release tag and then when I'm deploying the main blog (so where you are now), I include some python code to get the latest released version of each via extension the API and deploy them to the static part of this site. It means users get a stable, friendly url for downloading the latest version though, so it's an Ok temporary compromise. How I'm doing it now also means if I change the way I'm making them available then I won't have to update any documentation (or risk breaking outside links). Users can always get the latest and greatest on the main blog at a stable URL.

I could finally get back to finishing the server install doc...

## Still to come
### Unified release tool
I want everything in the system to build and release when something gets tagged with a release tag. The meat of that process has already been implemented but you can still currently (if you are a maintainer) push any tags you want, potentially breaking things.

I have been reading up on [semver](http://semver.org) and want to try and get something as close as possible to that implemented. The idea is you can manually add tags or branches for your own purposes, as long as they aren't semver compliant. All semver compliant tags are restricted for use with the release system. There is a branch for each major.minor version, which can only come off master.

I have been playing around with a few python libraries for working with git and gitlab, and would like to develop a simple release tool that works by calling the script with `major`, `minor`, `patch` or `pre`. `patch` and `pre` also require a branch. There can also optionally be a commit-ish passed which will be the commit tagged, as long as it can be made to correspond to the rules. These are a somewhat loose interpretation of semver. For example, if you want to tag a commit as a patch on the 0.2 branch that comes after the 0.2.2 tag but before the 0.2.3, the system will refuse. You can tag it with `pre`, which will generate a tag coming from something similar to what `git describe` produces - it fudges semver compliance by adding a minor version to the previous tag on the branch with the number of commits since the last tag plus 8 chars of the sha1. In theory any API additions should get a minor version but as the code has officially not been released, and may never be released, I'm Ok with that. It does make some assumptions about how development can proceed but that corresponds to how I see development proceeding, so that is a feature for me.
