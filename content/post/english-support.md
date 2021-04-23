---
title: English support
date: 2019-02-27
tags: ["project", "language learning", "Chinese", "English", "Applied linguistics"]
---

### UPDATE: 2020-12-01
English support has been temporarily removed in order to focus fully on Chinese. If there is significant community interest, that could always change.

Preliminary support for Chinese learners of English has been implemented and is now available for testing. As expected, integrating a second language pair required basically rewriting the entire system to be able to handle any input and output language.

That said, the inflectional characteristics of English are a new challenge for the system and have not been fully integrated. Quite a bit of work is still to do there. When that work is done it will mean it will be relatively easy to integrate most of the world's major languages. The work is mainly around how to best present lemmatised versions of various words to the learner, and how to then manage that for searching and storage.

It was hoped that the word-alignment returned by the currently implemented machine translation provider (Microsoft Azure/Bing) would enable significantly more accurate glossing. This turned out to be much more complicated than expected, and results poorer than the existing POS-based system. As such it has not been activated. Getting this right is obviously key to the whole system, and will be one of the major technical/theoretical challenges to ensure widespread adoption/utility.

Please get in touch if you want to test it out or have any suggestions for improvements.
