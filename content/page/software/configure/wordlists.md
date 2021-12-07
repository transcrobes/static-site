---
title: Word lists
comments: false
---

Wordlists are created by [importing and analysing texts](/page/software/configure/imports), then directing the system to create a list from the imported data. Texts can be simple lists of words (CSV or TXT are currently supported, more soon), or actual content (currently EPUB ebooks and SRT/VTT subtitles formats are supported, more soon). That makes it easy to both study lists like you might get for an exam, or a chapter in a textbook, but also content. You might really want to watch the latest blockbuster movie, and creating a list from the subtitles means you can spend some time going over the new vocabulary before you watch it (then afterwards also, which is a really great way to learn!).

## Wordlist Details
<img src="/img/wordlists/wordlist-show1.png"/>

#### Title and Description
Wordlists have a Title (which is required and is shown in lists) and a Description, that allows you to put in background information if you need to. 

#### Import
Each wordlist originates from an Import and you can create as many wordlists as you like from a single Import.

#### Processing status
When you create a wordlist, the system has to perform a number of calculations and updates to the database, so it can take a couple of minutes to finish. The Processing status tells you where the wordlist creation process is currently.

#### Nb to take, Minimum abs frequency, Minimum doc frequency and Order by

"Nb to take", "Minimum abs frequency", "Minimum doc frequency" and "Order by" are all options that allow you to control the items that get put in the list from the import. Say you import an eBook. Any given novel will have many thousands of unique words ("types" as they are often called), including lots of very uncommon ones. You might like to only select a maximum number of items for the list, so "Nb to take" allows that. You may also not want to actively learn the "uncommon" words, as you won't be seeing them often (so you can learn them later!). However, "common" is relative! Transcrobes uses the [spoken word frequencies](https://www.ugent.be/pp/experimentele-psychologie/en/research/documents/subtlexch/overview.htm) from the University of Gent (based on movie subtitle frequencies) to allow you to choose word frequencies. These are expressed in words-per-million. You can see the frequencies of any word in the [Notrobes](/page/software/learn/notrobes) tool, to get an idea of what you might like to set that at. Setting it to -1 has no limit. But the overall frequencies might not mean much. For example, overall the word "phoenix" might be very uncommon but, as it happens, very common in the Harry Potter book you want to read right now. So you can also choose to set a minimum frequency in the document, so the number of times the word appears in the book = Minimum doc frequency. Again, setting it to -1 will include everything. Because you can choose to limit to a maximum number of items, it also matter how you order the items, so the "Order by" allows you to control that, according to the two same criteria as the "minimum frequencies".

## Wordlist Progress
<img src="/img/wordlists/wordlist-show2.png"/>

The system also looks at how you have been learning over time, and gives you a view over how much you have learnt over the last two months. This gives you an idea of your rate of improvement, and allows you to have some idea when you might learn all the words.

## List view
<img src="/img/wordlists/wordlist-list.png"/>

The list view allows you to see the wordlists you already have, as well as giving you the Processing status.

