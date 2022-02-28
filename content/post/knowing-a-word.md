---
title: What does it mean to know a word, and how do we learn them?
date: 2022-02-21
tags: ["language learning", "words", "word knowledge"]
---

Probably the main indicator of progress in language learning is increasing "known vocabulary". While that sounds pretty uncontroversial* and simple, actually deciding what "knowing a word" is is actually a subject of hot debate! Particularly when we need to be very precise about things - exactly what you need when you create software - things start to get much less clear.

## How do you know whether you know something?

The answer to this question is one that has challenged philosophers and sages since time immemorial! While these are interesting things to think about, we can assume a certain number of things and rely on some widely held ideas about "what knowing is".

## What does knowing a word mean?

So if we are going to assume a typical view about knowing, then what are the different ways we can know a word? Lets look at how we typically talk about knowing words. The three most common ways (in Western culture at least) are probably:

- being able to give a definition, or explanation of "what the word means"
- understanding phrases/sentences that have the word in it in writing and/or speech
- using the word in appropriate spoken and/or written contexts

Is this everything that is relevant for digital tools that help with language learning?

### Knowing a word in your "native" language

If we take the three basic ways we typically talk about knowing a word above, one thing will immediately occur to many - it's not really a matter of knows/doesn't but one of degrees. People can often give you a definition or explanation for a word (ask anyone to give a definition of "cryptocurrency"!) but, for topics you know well, you will often say "hmmm, well, that's sorta it but...". We often hear or read (native speaker) people using words in situations that don't seem quite right. Words can often have meanings or usages that we don't know or forget. Anyone who considers themself a native speaker of English knows the word "moment", right? Well the *noun* "moment", sure, but the adjective, "moment", as in "this is a novel of great moment"? I recently learnt (or relearnt!) this particular meaning of the word. There are also very well-known examples, such as "bank" in "the bank of a river" and "the bank of England". 

So we all agree that words can have multiple meanings, and even educated native speakers might not know all of them. We can also agree that you can know a word more or less well, so you could know one meaning of a word very well and another only poorly.

### Knowing a word in a "second" language

So is knowing words in a second language any different? Well... sorta. One way we often test (in exams or in real life) whether someone knows a word in a second language is to ask for a translation into the person's native language. Often, in fact, the ability or inability to provide a quick translation/equivalent is considered sufficient to make a definitive judgement on whether someone "knows" or "doesn't know" what a word means in a second language. Unfortunately, particularly in certain learning environments, that is a terrible measure. As a personal example, I learnt Russian almost entirely by listening and speaking to Russians in Russia, living in a family on a high-school exchange, without books and without being given "the English word for it" when I didn't understand something. By the end of my stay (1.5 years), there were many, many words that I clearly "knew" - I was able to give 3-4 perfectly idomatic example sentences, and I was even able to give Russian synonyms. I was not, however, able to quickly give an English translation. I could generally get there but very often my Russian friends would be quicker. Obviously when provided with options I would immediately accept/reject appropriate/inappropriate ones but I certainly was not able to quickly give an accurate English equivalent. 

While many marvelled at how I had "become more Russian than a Russian", this sort of thing is actually quite common, particularly with English. Many, many academics and professionals the world over now have significantly more vocabulary/domain fluency in English than they do in their native language. While I did my software engineering degree in English, I moved to France straight after and then spent almost 15 years working in French. The software world is *extremely* dominated by English - the percentage of documentation, courses/training, and even source code written in English, even in countries that are considered to have very poor English, is very high. It certainly isn't that I'm not fluent talking about software matters in English, it is just that I am (or maybe was) *more* fluent in French. What's more, when discussing technical matters in French, you will often use certain technical words in English (with a French accent, of course!), but not *all* words (and usually with French grammar). In English I will have to think about what I am saying a little harder and might say something that sounds weird, before doing a retake and saying it properly. Non-native speakers might even be able to recite an exact dictionary definition for a word but still use it in ways that native speakers don't, or use vocabulary or forms in contexts where one shouldn't. For reasons I am fascinated to learn about, adults/professionals from certain (non-email) cultures think it's fine to send an email to a business contact with phrases such as "cud u plz send the invoice by tomorrow ?". And I am not talking about teenagers but balding, middle-aged men!

## Learning second language vocabulary

So why is all this discussion important for language learning? Because it is important to know that when you learn vocabulary, it is not a simple matter of there being words in a language that you go from "not knowing" to "knowing" with the flick of a switch (or clicking on a button!). It is also important to know that you never really "know a word", even in your native language, you just be better at using it (both reception and production) in a wider range of circumstances. There is no hard line between one's native language and other languages, and if you have particular domain/topic experience/knowledge, then you may well have deeper knowledge of some vocabulary than an educated native speaker (who is not a domain expert). It is also important how easily use of the word comes. If you know there is a word that is perfectly appropriate for this situation but it takes you 30 seconds to remember it, though you have actually used it very appropriately, there is still a meaningful sense in which you don't know it as well as other words that come immediately.

So this means that to truly *know* a word well you need to be able to *use* it well. By "use" I don't necessary mean produce - when you read a word you are still "using" vocabulary, at least in the (metaphorical) sense of "using it to get a the meaning"**.  So typically the more you use/consume vocabulary, and the wider the range of usage contexts, the better you get with it.

So if things are this complicated, why does Transcrobes only have a binary knows/doesn't know distinction?!?!? While work is ongoing to create extra, new modes for even more optimised vocabulary learning, the Transcrobes notion isn't really "knows" and "doesn't know" but rather "needs help" or "doesn't need it in this circumstance". At the moment we just rely on the learner telling the system "don't gloss this word anymore", but later we will try and calculate whether the learner can guess a word from context (which is truly fantastic for learning!) without having to concentrate too hard (which would mean they only spend a few minutes reading before they are too tired). **The key is that when you know enough to be able to remember/guess, with only the help of the context and not a gloss, then typically it is better for learning to no longer show the gloss**. So it is not that you already know a word or not, but whether it is better for you to have to remember/guess it or whether your concentration is better spent on trying to remember/guess *other* words. It's an optimisation problem - optimising your time, energy and enjoyment! We will work on several modes for long-term experiments to be able to make strong claims about this, but the fact is that there is currently no compelling science on the best way for learning vocabulary over the long term. Finding out about this sort of thing is exactly why Transcrobes is both a useful platform to learn with and a research platform at the same time!

There are lots of plans for detailed personalised analytics that will also include measures of how well the system thinks a learner knows words (based on their actual behaviour, not some random prediction algorithm!) but for the moment we provide a [view on how the system provides glosses for you over time](/page/software/learn/stats). And for a quick and easy measure of how your vocabulary knowledge is evolving, that is a much better, rough and ready estimate than any other software is able to provide, if you are using Transcrobes reasonably regularly!

Notes:

\* There are a few scholars that claim that grammar is more important for language learning but there aren't many, they don't provide robust scientific evidence for this claim, and they don't typically have much practical experience teaching second languages...

\** Some research suggests that appropriately elicited production can stimulate efficient learning but that is a complicated topic, for another day.
