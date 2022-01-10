---
title: Enrichment
comments: false
---

A primary goal of the system is to "increase the bandwidth to the brain" - giving you exactly the extra information you need to be able to understand and *also* to learn most efficiently.

{{< notice tip >}}
The page has information on how the system works under the hood. It is not required if you just want to use the system.
{{< /notice >}}

The system is able to give detailed, personalised help for each word (and soon grammatical patterns too) because of two things. 

1. It develops a learner model for each learner ("it knows what you know").
2. It analyses each piece of content into words (required for Chinese), sentences, phrases, etc.

With these two things the system can then calculate whether the learner needs help with something or not (basically, "it works out what you don't know"). Over time (and the more the system is used!), the system will get better and better at knowing what the learner needs help with.

# Learner model

"Learner model" is basically a fancy way of saying "what you know". The system collects data via all your interactions with the system (practicing vocab, reading web pages, watching subtitled videos, etc.), and then processes that data to be able to make decisions on your current level of knowledge. The more you use the system, the more data it can collect, and the more you do all of your language learning with the help of the system, the more accurate the final learner model will be.

Once it has this data, it can make predictions about what you don't know, and further predict whether you need help in a given context. Currently the system uses a very basic algorithm - "show a gloss if the user has never told us they know a word, otherwise don't". This will likely always be one of the best methods. In addition to being low-tech (no machine learning required!), it has a couple of advantages. Firstly, it relies on the learner (you!) to take responsibility for deciding whether you need to see help for a given word or not. In order to properly learn a word you need to see it many, many times, in lots of different contexts. The reason for this is that the "meaning of words" is deeply context-dependent. There are also often lots of secondary senses to any word - just take out an English dictionary and you can see that! As a native speaker of English, I am constantly learning new meanings for words I thought I knew very well, e.g, "importance" is actually quite a common meaning for the word "moment" in English, but I had either forgotten that or never knew it until recently. 

# Content analysis

Content analysis is currently done mainly using Stanford University's [CoreNLP](https://stanfordnlp.github.io/CoreNLP/). This parses texts into sentences (phrases) and words. 

# Enrichment

From there we can start enriching the texts with hypertext and other tools to provide meaningful help directly where it is needed. With a click (or mouseover (desktop), longpress (mobile)) the learner can get a wealth of information about the word, like English (L1) definitions, synonyms, the part-of-speech, HSK (international exam) level, word frequency, and also other similar contexts where you have already seen this word before (with the same part of speech).

Finally, we look at the part of speech CoreNLP gives us and look for the best English (L1) translation of the word for the given context, typically just by looking to see whether we have something that corresponds to that in one of the dictionaries we have and proactively give this in brackets after the words, for the words the system thinks the learner needs help with. Alternatively, learners can choose the "sound form" (eg. Pinyin for Chinese, this is particularly good for heritage learners, who might understand quite a lot but not read very well, etc.), or a known synonym (e.g, a Chinese word you have told the system you know that has a similar meaning), or just with spaces between the words. Each learner has different needs and those needs may change from one minute (hour?) to the next. For example, our ability to concentrate (and learn, remember, etc.) is very significantly affected by how much sleep we get, blood-sugar levels, ambient lighting/noise, whether someone was rude to you on your way home from school... Each of us has a "cognitive load budget" (basically a level of difficulty) that needs to be carefully managed in order to maximise enjoyment and learning value. 

As we collect more data, we will add extra "automated" modes that learners will be able to try out, where the system will actively look at the learner (actions, eye-tracking, etc.) to try and work out whether help is needed *at this exact point in time for this exact word*. Hopefully one day we'll be able to make great predictions not only on what is required for understanding but also what is most valuable for the learner, given the priorities they have told the system are important *right now*. This is crucial because while enjoyment might be maximised by a 100% translation into your native language, you are not going to get much learning value out of that! It is key to be able to keep yourself in the zone where you are both enjoying yourself *and* learning at your maximum potential. This is (basically) what the Russian scientist Lev Vygotsky called the "Zone of Proximal Development" and similar (in spirit) to what the American scientist Stephen Krashen called "i + 1". This has always been the elusive Holy Grail of language learning software, and hopefully reliably finding it is not too far off now!

These modes will likely require lots and lots of data on lots and lots of learners, and might well not be right for everyone. You will see these appear as options over time directly in the software.

