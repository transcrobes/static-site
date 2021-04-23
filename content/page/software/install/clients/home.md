---
title: Clients
date: 2021-04-21
comments: false
---

There are now two main ways to interact with Transcrobes - the interactive website and the Chrome browser extension.

Many more integrations are planned, such as for online video streaming platforms (Netflix, Youtube, etc.). Here you will find links to installation and configuration documentation for client applications, and up-to-date information on what applications we plan to support in the near future.

Throughout the site, "Chrome (and compatible)" means Chromium-based browsers, such as Google Chrome, Microsoft Edge, Yandex Browser, vanilla Chromium, etc. "Desktop" means Windows, Mac OSX and Linux.

# Supported Applications

| Name | Application Type | Platforms | Support Type | Status | Comments |
|----------|-------------|------|------|------|------|
| [Transcrobes site](/page/software/install/clients/transcrobes) | Website | Chrome (and compatible) & Firefox | Web | Full Support | Main active and content-based learning environment |
| [Brocrobes](/page/software/install/clients/brocrobes) | Chrome extension | Chrome (and compatible) on Desktop, Yandex Browser on Android | Browser extension | Full support | Allows enriching all textual web content |


# iOS Support
iOS support is noticeably absent from the above lists. 

### Transcrobes site
Many years after all the other major browsers properly support most of the critical Service Worker functionality, Safari still doesn't. There are also opaque restrictions on many features (like indexeddb, size, etc.) that make it a requirement to have specific code for iOS/Safari that aren't required for anything else. That requires a lot of extra work, and the maintainer doesn't have any Apple devices to test on. Hopefully the situation will change soon though, so we can support Apple users also.

### Brocrobes
Unfortunately, Apple's policy on allowing support for plugins on iOS is very restrictive, and we don't currently have the resources to find solutions to the complex problems that this policy generates. We hope to find a solution eventually but that may take a while.

