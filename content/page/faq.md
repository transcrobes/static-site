---
title: FAQ
date: 2021-04-21
subtitle: Everything you always wanted to know but were too afraid to ask...
comments: false
---

# For Everyone
## Current Status
Transcrobes currently only fully supports learning Chinese for English speakers. If your English is very good then you should be Ok, but otherwise you're better to wait until your preferred language has been implemented. Partial support was developed for Chinese learners of English but has since been put on stand-by. It will be brought back when Chinese for English speakers support is first-class.

## How do I install Transcrobes?
Transcrobes has both [server](/page/install/server/overview) and [client](/page/install/clients/overview) components. There are not currently any public servers (but there is an [ongoing academic research project](/page/meaningful-io/transcrobes), so you may be accepted into that if you are interested), so if you would like to try out the system you will need the knowledge to set up the server part, or know someone who is willing to do that for you.

If you are a developer and want to get your hands dirty, then check out the [contributing guidelines](/page/contribute) or head directly over to the [development section](/page/development) to get started.

## How much does it cost?
The software itself is fully open source, so is "free". That said, Transcrobes has a non-optional server component, and will also need someone to install and maintain the installation (and server) - neither of those are "free", though someone might be willing to give them to you. You also need high quality dictionaries and a good automated translation system - many languages don't have free versions of those either.

If you are a developer with some time on your hands and free space on a server, and the language you want to learn has free dictionary resources available, then you can probably get by only spending your own time.

## Does anyone offer the application as a service? Even if I pay for it?
Not yet. The project maintainer, Anton, thinks that one or more content/search providers (Baidu, Google, Wechat/QQ/Tencent, Yandex, Amazon, etc.) should provide this as a free value-added service on top of their normal content offerings but there are many ways to finance the parts that aren't free. Anyone could create a company and offer this service for a fee today. We'll update this FAQ if we find out about anyone providing this kind of service.

# For language learners
## My first language is X, can I learn Y?
Transcrobes works by giving you context-based help in your first language (glosses, definitions, grammatical help, etc.) for the language you are learning. It (currently) relies very heavily on writing to give you the quick help you need to understand the content in a fluid way. It also means that there need to be good digital dictionaries from the language you are learning into your first language, and support for these needs to be added to Transcrobes. Because there are many thousands of language pairs, Transcrobes doesn't support all of them yet. Check the list of [supported language pairs](/page/supported-languages) to see whether yours is currently supported.

## I just started learning X, can I use Transcrobes?
Yes. Transcrobes contains a spaced repetition flashcard system, inspired by the well-known Anki, and further optimised for language learning and use with the rest of the system. If you start from the beginning with Transcrobes then when you are ready to consume real content then the system will Just Work. Spaced repetition is a fantastic way to learn vocabulary quickly, and there are also other integrated tools, so you will benefit from using Transcrobes straight away.

## Can I just use Transcrobes to learn a language?
No. Transcrobes may evolve into a fully featured language learning platform in the future but at the moment it focusses on letting you consume real-world content, and includes a number of tools to help you learn vocabulary. You will need to learn about grammar, pronunciation and how to express yourself somewhere else (like a school, online course, tutor, etc.).

That said, once you have the basics, Transcrobes can help you do a lot of the rest. Consuming large amounts of content is pretty much the only way to get to more advanced levels of language knowledge and fluency. You will still need to produce (speak, write, etc.) to become really fluent and Transcrobes doesn't help with that yet. It will someday though!

# For language researchers
## What is it?
Transcrobes is an open source project that puts the learner at the centre of the "extensive content consumption" process. It builds a representation of the learner's lexical (and soon grammatical) knowledge and then uses that information to enrich (gloss) real-world texts **in-place** as learners consume real-world content, on their preferred devices and in their preferred applications.

Because the system knows what a learner knows, it also knows what the learner doesn't, so only glosses unknown words. Not words that some complicated algorithm predicts the learner doesn't know and regularly gets wrong - it glosses all the words the learner **actually** doesn't know, and almost none of the words they do. Because automated parsing and translation tools aren't perfect, it still means the learner has some guess-work to do (and so active processing) but for most learners and most texts, it gets them very close to the famous 95-98% that enables fluid, enjoyable consumption of texts. Any texts, not just "Where is Brian? Brian is in the kitchen." type texts.

<!---
## Why should I be interested?

## What does it add to a "normal" classroom language learning context?
-->
