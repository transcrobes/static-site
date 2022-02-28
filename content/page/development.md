---
title: Development
date: 2021-04-21
comments: false
---

# Basics
After spending quite a bit of time setting up properly on Gitlab, it was decided to move to Github. Basically get in touch with [the maintainer](/page/contact/) if you are interested and have some development experience.

There is an (incomplete) [backlog](https://github.com/transcrobes/transcrobes/issues) of stuff needing to be developed. 

## Communication
The two main forms of communication are [via issues on the Github issue tracker](https://github.com/transcrobes/transcrobes/issues), or on [the discussion list](https://github.com/transcrobes/transcrobes/discussions). If you are new, please make sure you have discussed with a regular committer/maintainer BEFORE you start working to avoid any time-wasting and frustration. Communicate early, communicate often.

## Languages
The frontend is developed in React/Typescript (4.4+), using React-Admin as a base, with Material UI elsewhere for the visual side of things. The backend is Python (3.9+) - FastAPI with Faust Streaming as the job runner and data ingestion platform. Other (external) components such as the Stanford CoreNLP module, OpenReplay session recorder, Postgresql database, etc, are hosted internally (except Azure text translator, which is used as the translation engine, though should be replaced at some point), as are the backend services, on a k3s Kubernetes cluster, which is configured and deployed using Helm charts.

## Source repository
The project uses Git and all development gets done on github.com.

All code/git contributions should be signed with `git -s`, which means you certify you have the right to contribute what you are contributing (see https://developercertificate.org/).

All code submissions need to have an [associated issue](https://github.com/transcrobes/transcrobes/issues). You should fork the project into your private space, do your stuff then submit a pull request, mentioning the issue.

The project strives for a clean, single file git history, systematically rebasing on HEAD rather than merge commits. This presupposes a particular development style but makes for much, much nicer histories.

## What should I work on?
There is heaps of cool stuff to do or, because you also probably want to use it to learn a language, just the stuff that you care about - it's all good.

## The build system
Transcrobes now uses Github, but hasn't for migrated most things from Gitlab. Originally a quite advanced build system was set up but it wasn't really justified. Future work will be done when a real need arises.
