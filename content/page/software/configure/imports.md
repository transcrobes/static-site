---
title: Importing lists and content
comments: false
---

<p style="text-align:center"><a style="color:white" target="_blank" href="https://youtu.be/w7OhcIU-WAM"><button style="border-radius: 8px;text-align:center;background-color:#42a5f5;">Discover how to use Imports on <img style="width:100px;display:inline;" src="/img/yt_logo_rgb_light.png" /></button></a></p>

# Supported formats
| Name | Use case | Details | Supported Extensions |
|----------|------|-------|------|
| CSV | Word lists for monitoring exam progress or training the system on what you know | Comma separated plain text files | **.csv** |
| TEXT | Copy/paste from an unsupported format (like Word or PDF) | Content files in plain text | **.txt** |
| SUBS | Watch Chinese language video | Find subtitles on sites like opensubtitles.org and import | **.srt**, **.vtt** |
| EBOOK | Reading Chinese language books | International standard format for eBooks | **.epub** |

Lists of vocabulary and content can be imported into Transcrobes. 

<img style="max-width:70%" src="/img/imports/3body1.png"/>

When files are imported, they are parsed and analysed, and important information is stored about them.
<img style="max-width:70%" src="/img/imports/3body2.png"/>

These analyses can then be used for creating [word lists](/page/software/configure/wordlists). [Word lists](/page/software/configure/wordlists) are the basis for several Transcrobes features, including vocabulary revision and setting goals, with more to come soon. Depending on the file type, imports of the appropriate type will appear as [ebooks](/page/software/learn/boocrobes) or [media/video](/page/software/learn/moocrobes) (for subtitles). Those interfaces then allow the enriching of the content for reading/watching with the comprehension aids the system provides.

# Supported formats
## Importing lists

The list import system is currently quite simple. You can currently import lists of words in CSV format. The importer will only look at the first column, and will simplify any traditional characters to make sure there are only simplified Chinese characters. Any reasonable spreadsheet programme will allow you to very easily create a CSV file in the required format.

If you want to import other things like definitions for personalised lookups, revision, etc, then you can do that using the [user dictionaries](/page/software/configure/userdictionaries). You can then choose this dictionary as your preferred source for definitions everywhere they can appear.

## Importing content
### Importing ebooks
Transcrobes supports ebooks in the W3C standard EPUBv3 format. The free and open source [Calibre ebook managment software](https://calibre-ebook.com/) is an amazing tool that allows to convert from many formats into many other formats, including into EPUBv3, and works on Windows, Mac and Linux. If you have ebook files in other formats you can use Calibre to convert. If you don't want to download and install Calibre (you should!), then many sites also allow converting online.

### Importing subtitle tracks (for watching movies)
Transcrobes includes [a movie/media player](/page/software/learn/moocrobes). Currently video content is supported by importing subtitle files in either SRT or VTT formats. Currently learners need to source both these and the video files that accompany them but work has started to allow using Transcrobes with streaming media sites (Netflix, etc.), which will likely mean a learner simply needs to click a button on a supported site and they will be able to have their personalised comprehension aids.

## Users of digital flashcard systems
If you are already using a digital flashcard system (like Anki, Memrise, etc.), most good systems allow you to export your data. You should export this as a simple list of words or, if your software doesn't do that, you will need to extract one, for example with a spreadsheet application like MS Excel or LibreOffice.

We do not currently support importing revision history but will do so at some point, when resources permit.
