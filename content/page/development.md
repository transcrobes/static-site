---
title: Development
date: 2021-04-21
comments: false
---

# Basics
After spending quite a bit of time setting up properly on Gitlab, it was decided to move to Github. Most issues have not been migrated or updated for quite a while. Basically get in touch with [the maintainer](/page/contact/) if you are at all interested.

There is a [backlog](https://gitlab.com/groups/transcrobes/-/issues) of stuff needing to be developed, from [unit testing](https://gitlab.com/transcrobes/transcrobes/issues/7) to [trying out the latest recurrent neural networks on the video OCR system](https://gitlab.com/transcrobes/transcrobes/issues/16) (Tesseract OCR via CCExtractor). Many parts of the site and apps are ugly, so if you like design/UI work then there is lots to improve. If you are more admin/devops then the plan is for the server components to be able to deployed to new production environments with a few clicks straight from the CI (to a Kubernetes cluster).

## Communication
The two main forms of communication are [via issues on the Github issue tracker](https://github.com/transcrobes/transcrobes/issues), or on [the discussion list](https://github.com/transcrobes/transcrobes/discussions). If you are new, please make sure you have discussed with a regular committer/maintainer BEFORE you start working to avoid any time-wasting and frustration. Communicate early, communicate often.

## Languages
The server-side code is mainly in Python 3.9+, and the browser-based client-side code in javascript and html. Originally several other client apps were planned but realistically bandwidth for anything other than browser/JS (or hopefully TS) is unlikely.

## Source repository
The project uses Git and all development gets done on github.com.

All code/git contributions should be signed with `git -s`, which means you certify you have the right to contribute what you are contributing (see https://developercertificate.org/).

All code submissions need to have an [associated issue](https://github.com/transcrobes/transcrobes/issues). You should fork the project into your private space, do your stuff then submit a pull request, mentioning the issue.

The project strives for a clean, single file git history, systematically rebasing on HEAD rather than merge commits. This presupposes a particular development style but makes for much, much nicer histories.

## What should I work on?
There is heaps of cool stuff to do or, because you also probably want to use it to learn a language, just the stuff that you care about - it's all good.

## Tests
Please bear in mind that your code submissions MUST be accompanied by proper tests. Untested code will not be merged. Coverage is still poor, so if that means that you have to also write tests for someone else's code then please accept that author's apologies - tests are necessary and they gots to get wrote somehow... Someone will write tests for everything at some stage so you can also wait if you don't want to write tests for someone else's code. But please do! :-)

## The build system
Transcrobes now uses Github, but hasn't for migrated most things from Gitlab. Originally a quite advanced build system was set up but it wasn't really justified. Future work will be done when a real need arises.
