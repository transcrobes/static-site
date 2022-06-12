---
title: Reader Settings
comments: false
---

Each interface allows you to configure the reading aids (including for subtitles) in a fairly standard way, with additions whether that makes sense.

Each content screen has a <img style="display:inline" src="/img/configure/reader-settings0.png" /> button to take you to the specific configuration for it. Have a play and find what works for you best!

## Main font configuration

<img style="max-width: 80%" src="/img/configure/reader-settings1.png" />

Here you can choose to override the default fonts in the interfaces where that makes sense, like boocrobes and moocrobes.

## Glossing configuration
<img style="max-width: 80%" src="/img/configure/reader-settings2.png" />

Here you can configure the glossing. For further details have a look at [an explanation of the glossing types](/page/software/configure/glossing/)

## Other options
<img style="max-width: 80%" src="/img/configure/reader-settings3.png" />


## Dictionaries

By default the system includes a [Microsoft Bing-based system](https://www.microsoft.com/en-us/translator/business/translator-api/) and [CC Cedict](https://cc-cedict.org/wiki/). You can also add more personal dictionaries [in the dictionary management interface.](/page/software/configure/userdictionaries/).

The easiest way to understand how this works is by testing it out. You can easily see how the changes affect the result in real-time [in Textcrobes](/page/software/learn/textcrobes/), so copy some text there, open up the settings and have a play!

The dictionary settings allow you to configure where the definitions come from for the glosses, mouseovers and popups. By default, the system tries to make the best possible match, so it will look at the part of speech. You might not always have that information but still want for a given dictionary to take precendence over the others, so you can activate "Strict Provider Ordering" if you want to guarantee an ordering. Don't worry, if no match is found it will always fall back to the next dictionary!

<img style="max-width: 80%" src="/img/configure/reader-settings4.png" />

You can drag and drop the dictionaries to be Selected or Unselected, and change the ordering of Selected dictionaries. The order mainly matters if activate the "Strict Provider Ordering" (see above) but it will also prefer the first definition it finds in this order if you have the right part of speech and word length (the system prefers glosses 6 characters long, so they don't take too much space).


