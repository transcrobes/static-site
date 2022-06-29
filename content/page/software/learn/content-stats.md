---
title: Content Stats
date: 2022-02-21
comments: false
---

In various places in the application that analyse and enrich content you can find little coloured boxes that appear, like you can see on the Content list page

<img src="/img/content-stats/small-box1.png"/>

Or on Brocrobes, that appears when you Transcrobe a webpage

<img src="/img/content-stats/small-box0.png"/>

### Colours
The system colour-codes the expected difficulty level, depending on the percentage of known words and the sentence length. We're working on more advanced and even more personalised options at the moment.

| Colour | Difficulty level |
|----------|-------------|
| <span style="background-color:#4caf50;color:white;padding:0.2em;border-radius:10px">88:78:90:81:15</span> | Straightforward |
| <span style="background-color:#03a9f4;color:white;padding:0.2em;border-radius:10px">79:48:80:51:25</span> | Moderate |
| <span style="background-color:#ff9800;color:white;padding:0.2em;border-radius:10px">49:28:50:21:42</span> | Challenging |

The Brocrobes example above shows the following data: <span style="background-color:rgb(2, 136, 209);color:white;padding:0.2em;border-radius:10px">79:48:80:51:15</span>, for which you have an explanation if you click anywhere on the button to the left of the <img style="display:inline;" src="/img/brocrobes/stats3.png" />.

<img style="max-width:50%" src="/img/content-stats/box0.png"/>

The numbers correspond to the __Ratio__ column and should be fairly self-explanatory, except maybe the difference between "types" and "tokens".

### Types and Tokens

Let's look at an example in English: The cat sat on the mat.

So how many words are in that sentence? 6? or only 5? Because the word "the" appears twice, both answers are correct! In fact, in that sentence there are __6 tokens__ and __5 types__.

We can think of types as only counting unique words and tokens as counting all words individually. Exactly the same principle applies for characters, there are 17 tokens but only 9 types (excluding punctuation), though obviously that is much more interesting to know about for Chinese than English!

Both of these percentages can give you information about how easy reading a given text might be.

### Sentence length

The average number of words in a sentence is also quite useful for predicting how difficult a text might be but you should always remember that there are many, many other factors (interest, topic familiarity, tiredness,...) that can affect reading comprehension, so don't worry if the system shows you not knowing a very high percent. The more you read, the more you learn!


