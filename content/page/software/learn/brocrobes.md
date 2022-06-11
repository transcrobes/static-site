---
title: Brocrobes
date: 2021-04-21
comments: false
---

Brocrobes is a browser extension that allows you to enrich any webpage with the your own, personalised help. When you click on the extension button, the extension will look for all text in the language you are learning on the page, and send that to the server. The server will then get context-based definitions for all the words, and translations for all the sentences, and send that back to the browser. The browser will then replace each part of the webpage with special, interactive text, including glosses (inline translations), but _only for the words you don't know_. A picture is worth a thousand words, and three are worth three thousand!

#### Original Site
<img style="max-width:50%" src="/img/brocrobes/xinhua1.png"/>
<br/>

#### After transcrobing
<img style="max-width:50%" src="/img/brocrobes/xinhua2.png"/>
<br/>

#### Popup with sentence translation showing
<img style="max-width:50%" src="/img/brocrobes/xinhua3.png"/>

## Using Brocrobes

To use brocrobes, [after you have installed it](/page/software/install/clients/brocrobes), simply navigate to the webpage you are interested in - any webpage - and click on the web extension button <img style="display:inline;" src="/img/favicon.ico" />. Depending on the complexity and size of the webpage, it might take a few seconds for the enrichment process to start to be visible but rest assured, Transcrobes is working hard in the background.

## Page statistics
After you start transcrobing a page, a small box will appear at the top right corner of the screen. 

<img style="max-width:50%" src="/img/brocrobes/stats1.png"/>

If the button is obscuring something important (like a menu option) you can close it by clicking on the <img style="display:inline;" src="/img/brocrobes/stats3.png" /> or you can put it down on the bottom right hand corner instead [in the configuration](/page/software/install/clients/brocrobes).

The example here shows the following data: 64:35:77:50:17, for which you have an explanation if you click anywhere on the button to the left of the <img style="display:inline;" src="/img/brocrobes/stats3.png" />.

<img style="max-width:50%" src="/img/brocrobes/stats2.png"/>

The numbers should be fairly self-explanatory except the difference between "types" and "tokens".

### Types and Tokens

Let's look at an example: The cat sat on the mat.

So how many words are in that sentence? 6? or only 5? Because the word "the" appears twice, both answers are correct! In fact, in that sentence there are 6 tokens and 5 types. We can think of types as only counting unique words and tokens as counting all words individually. Exactly the same principle applies for characters, there are 17 tokens but only 9 types (excluding punctuation), though obviously that is much more interesting to know about for Chinese than English!

Both of these percentages can give you information about how easy reading a given text might be.

The average number of words in a sentence is also quite useful for predicting how difficult a text might be but you should always remember that there are many, many other factors (interest, topic familiarity, tiredness,...) that can affect reading comprehension, so don't worry if the system shows you not knowing a very high percent. The more you read, the more you learn!

### Webpage formatting issues
Sometimes `brocrobes` will make a bit of a mess of a webpage, due to bad webpage coding by the site developers. The better you know the language of the webpage, the less of a mess those sites will be. The idea behind brocrobes is that if there are so many words on a page that get translated inline that it makes a mess, you definitely won't be able to understand anything on the page without it. So short of using a full webpage translation tool like Google Translate (which can make a mess too), you either have a choice of not being able to understand anything, or having the page a bit messy. It's up to you - click on the <img style="display:inline;" src="/img/favicon.ico" /> Transcrobe Me! button or not - you decide!

This will definitely get better over time, and we hope that eventually some sites will add direct support for Transcrobes. We are also thinking actively about new features that will make brocrobes even more useful - each language learner has different needs and Transcrobes wants to let each learner mix and match the exact things they need at the current point in time.

The screenshots above show glossing of the unknown words into English but you can also configure [other glossing types](/page/software/configure/glossing).
