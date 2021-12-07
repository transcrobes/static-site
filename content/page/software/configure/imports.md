---
title: Importing lists and content
comments: false
---

Lists of vocabulary and content can be imported into Transcrobes. 

<img style="max-width:70%" src="/img/imports/3body1.png"/>

When files are imported, they are parsed and analysed, and important information is stored about them.
<img style="max-width:70%" src="/img/imports/3body2.png"/>

These analyses can then be used for creating [word lists](/page/software/configure/wordlists). [Word lists](/page/software/configure/wordlists) are the basis for several Transcrobes features, including vocabulary revision and setting goals, with more to come soon. Depending on the file type, imports of the appropriate type will appear as [ebooks](/page/software/learn/boocrobes) or [media/video](/page/software/learn/moocrobes) (for subtitles). Those interfaces then allow the enriching of the content for reading/watching with the comprehension aids the system provides.

# Supported formats
## Importing lists

Basically, you can import lists of words in CSV/text format. If the words are imported each word on a single line, or separated by commas, then the system should have no problem parsing them. Transcrobes can also import texts in plain text format, though currently they will only be able to be used for creating lists.

## Importing content
### Importing ebooks
Transcrobes supports ebooks in the W3C standard EPUBv3 format. The free and open source [Calibre ebook managment software](https://calibre-ebook.com/) is an amazing tool that allows to convert from many formats into many other formats, including into EPUBv3, and works on Windows, Mac and Linux. If you have ebook files in other formats you can use Calibre to convert. If you don't want to download and install Calibre (you should!), then many sites also allow converting online.

### Importing subtitle tracks (for watching movies)
Transcrobes includes [a movie/media player](/page/software/learn/moocrobes/). Currently video content is supported by importing subtitle files in either SRT or VTT formats. Currently learners need to source both these and the video files that accompany them but work has started to allow using Transcrobes with streaming media sites (Netflix, etc.), which will likely mean a learner simply needs to click a button on a supported site and they will be able to have their personalised comprehension aids.

## Users of digital flashcard systems
If you are already using a digital flashcard system (like Anki, Memrise, etc.), most good systems allow you to export your data. You should export this as a simple list of words or, if your software doesn't do that, you will need to extract one, for example with a spreadsheet application like MS Excel or LibreOffice.

We do not currently support importing revision history but will do so at some point, when resources permit.
