---
title: Supported Languages
date: 2021-04-21
comments: false
---

# Prerequisites
In order for a language pair to be properly supported by the system, two things (currently) need to be accessible and integrated:

1. A parts-of-speech parser needs to exist for the learning language. The system (currently) uses the open source [Stanford CoreNLP](https://stanfordnlp.github.io/CoreNLP/), which (currently) supports English, Chinese, French, German, Spanish and Arabic. Adding support for those learning languages is thus relatively trivial, and probably covers 70-80% of the second languages that people commonly learn.

1. A good learning language -> native language machine translation system needs to be available. For the system to be any good, then there also needs to be at least one (and preferably several) learning language -> native language digital dictionary. The dictionary can be free or paid, local or web API. If the dictionary is not in an "open" format or a web API, then bear in mind that support for any application or library that enables dictionary access will have to be added to the system before it can be used, and that could take quite a bit of time and resources.

## Other work
The system was first created for a native English speaker to learn Chinese, and was originally optimised only for that. Different languages, and particularly different writing systems, often have unique characteristics that would benefit from extra features to help learning. The goal is to support at least all major languages but that will take some time to implement.

# Currently supported languages
If your language pair is not listed here, please create a ticket in the issue tracker (only if one doesn't already exist!) [here](https://github.com/transcrobes/transcrobes/issues), making sure to mention the native language and learning language. If an issue already exists then add your vote to it - issues with lots of votes get looked at first, so the more votes, the quicker you'll get your language.

| Native language | Learning language | Status | Supported dictionaries |
|----------|:-------------:|------:|------:|
| English | Chinese (simplified) | Full support | [Bing Translate](https://azure.microsoft.com/en-us/services/cognitive-services/translator-text-api/)\*, [CC Cedict](https://cc-cedict.org/editor/editor.php), [ABC Chinese-English](https://wenlin.com/abc)\*\* |
| Chinese (simplified) | English | TEMPORARILY REMOVED | [Bing Translate](https://azure.microsoft.com/en-us/services/cognitive-services/translator-text-api/)\*, [ABC English-Chinese](https://wenlin.com/abc)\*\* |

\* Bing Translate currently gives 2 million translated characters free every month, more than that requires a paid subscription

\*\* ABC dictionary support requires that a licence for the dictionary content be negotiated with the folks at Wenlin.
