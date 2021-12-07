---
title: Browser extension
date: 2021-04-21
comments: false
---

# Transcrobes on the Web {#browser-config}

Transcrobes includes a Chrome browser extension `brocrobes`. You can install the extension from the [Chrome Web Store](https://chrome.google.com/webstore/detail/brocrobes/akeangohpdjllngpjiodmebgfhejbbpo?hl=en-GB)


# Connecting to the Transcrobes Server {#browser-login}

You will need to connect the extension to the server with the server URL, your username and password. Get in touch with your server admin for information on getting those. If you are enrolled in the [Meaningful IO Research project](/page/meaningful-io/home), please follow [the specific instructions for that](/page/meaningful-io/experiment) to sign up.

After you have signup details and installed the extension, you will need to head to the extension configuration/options page. First right-click on the extension button (you might need to make it show it first), then select "Extension options".

<img style="max-width:70%" src="/img/configure/brocrobes-init1.png"/>

Now enter the information given to you by your administrator, or what you entered when you signed up into the form:

<img style="max-width:60%" src="/img/configure/brocrobes-init2.png"/>

Now you've done that, you can start using the extension. Check out [the documentation](/page/software/learn/brocrobes) to see what you can do with it.

## Note on iOS

Unfortunately, Apple don't allow allow any form of extensions on iOS, and Chrome for iOS is not really Chrome at all (it uses Apple's built-in Safari HTML engine, not Chromium's because Apple won't let anyone else have an HTML engine on their platform...). We don't currently have a solution for using Transcrobes on iOS, so you will need to use one of the supported platforms until we do. There are also several standard browser functionalities that Safari doesn't implement (that everyone else already does, namely some [important Service Worker APIs](https://developer.mozilla.org/en-US/docs/Web/API/Client/postMessage)) which means it was not possible to properly support Safari at all. We hope this will change, and if resources permit, we'll try and find a workaround solution as soon as possible.
