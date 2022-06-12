---
title: Browser extension
date: 2021-04-21
comments: false
---

# Transcrobes on the Web {#browser-config}

Transcrobes includes a Chrome browser extension `brocrobes`. You can install the extension from the [Chrome Web Store](https://chrome.google.com/webstore/detail/brocrobes/akeangohpdjllngpjiodmebgfhejbbpo?hl=en-GB). If you haven't already:

<p style="text-align:center"><a style="color:white" href="https://am.transcrob.es/#/signup"><button style="border-radius: 8px;text-align:center;background-color:green;">Sign up for free to be a part of Transcrobes today</button></a></p>

# Connecting to the Transcrobes Server {#browser-login}

You will need to connect the extension to the server with the server URL, your username and password. Get in touch with your server admin for information on getting those. If you are enrolled in the [Meaningful IO Research project](/page/meaningful-io/home), please follow [the specific instructions for that](/page/meaningful-io/experiment) to sign up.

After you have signup details and installed the extension, you will need to head to the extension configuration/options page. First click on the Transcrobes extension button in your taskbar <img style="display:inline;" src="/img/favicon.ico" /> (you might need to make it show it first) or right-click it and select "(extension) options".

Now enter your signup information into the form:

<img style="max-width:80%" src="/img/brocrobes/config1.png"/>

## Configuration options

After the installation has finished, you will be presented with some extra configuration options.

The options that are specific to Brocrobes are:

<img style="max-width:90%" src="/img/brocrobes/config2.png"/>

"Show suggestions" can provide suggestions at a few places while you get used to the functionality. Turn it off it these get annoying!

[Page analysis](/page/software/learn/brocrobes/#page-statistics) is a feature that will calculate the percentages of known words, characters and other difficulty metrics like sentence length, to give you a very quick idea of how hard you might find the page. [More info is available here.](/page/software/learn/brocrobes/#page-statistics) 

All the other options you see are the same options you will see in many places, so [head to the standard reader settings documentation](/page/software/configure/reader-settings/) to learn about those!

## Using Brocrobes

Now you've done that, you can start using the extension. Check out [the usage documentation](/page/software/learn/brocrobes) to see what you can do with it.

## Note on iOS

Unfortunately, Apple don't allow allow any form of extensions on iOS, and Chrome for iOS is not really Chrome at all (it uses Apple's built-in Safari HTML engine, not Chromium's because Apple won't let anyone else have an HTML engine on their platform...). We don't currently have a solution for using Transcrobes on iOS, so you will need to use one of the supported platforms until we do. There are also several standard browser functionalities that Safari doesn't implement (that everyone else already does, namely some [important Service Worker APIs](https://developer.mozilla.org/en-US/docs/Web/API/Client/postMessage)) which means it was not possible to properly support Safari at all. We hope this will change, and if resources permit, we'll try and find a workaround solution as soon as possible.
