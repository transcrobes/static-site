---
title: Brocrobes Privacy Information
date: 2021-04-21
comments: false
---

## Preambule
Brocrobes is intended to allow you to read any text in the foreign language you are learning, no matter what your level in that language is. That is a quite revolutionary idea compared with most previous language learning, which has tried to find or create texts with certain types of words and grammatical structures that are supposed to be appropriate for learners at a particular level. Learners are all supposed to magically be interested in the same stuff, and the same stuff is supposed to be at the right level, no matter what the learning background of the learner is. Needless to say, the scientific evidence for that approach is not great! 

## Important Privacy Points
*Transcrobes takes a different approach to deeply personalise reading but that approach has significant privacy implications that you MUST be aware of. So what are they?*

- Brocrobes starts working when you click on the "Transcrobe Me!" button that the browser extension installs in the browser extensions area of your browser. 
- Brocrobes takes no action itself and records no data in any form unless you click on that button. 
- Once you have clicked, Brocrobes looks at all the text that is in the viewable part of your screen for words/phrases in the language you are learning. 

*All the text it finds in the foreign language on the page where you click the button will be sent to the server*. 

- That means you must be very careful to only try and "Transcrobe" webpages that you are happy sending to an external service. As you move down a page and new text becomes visible, Brocrobes will send the new text to the server, and continue to do so. 
- If you refresh the page without clicking on the "Transcrobe Me!" button again, the system immediately stops working, and will no longer collect or send any further information - unless you click the button again.

Both Brocrobes and Transcrobes are fully open source, or use publicly accessible APIs (currently only the Microsoft Bing Translation API). That means you can download and host a version of the Transcrobes server component without sharing your personal information with anyone. 

You can also use someone else's server, if that person creates an account for you. 

There is currently no default service and no default account. That means even if you click the button, it won't do anything until you have manually gone into the extension settings and entered a username, password and server URL.


## What happens to my data when I send it to the Transcrobes server?
Brocrobes and Transcrobes are separate open source projects in the sense that you could replace the Transcrobes server component and still keep the Brocrobes browser plugin, so for information on how your data are managed in Transcrobes, please check out the [Transcrobes Privacy Page](/page/install/server/server-privacy)

### <- [Back to the Brocrobes main page](/page/install/clients/brocrobes)
