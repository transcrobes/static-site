---
title: Boocrobes
date: 2021-04-21
comments: false
---

<p style="text-align:center"><a style="color:white" target="_blank" href="https://youtu.be/-TDHhtdP-Xk"><button style="border-radius: 8px;text-align:center;background-color:#42a5f5;">Discover how to use Boocrobes on <img style="width:100px;display:inline;" src="/img/yt_logo_rgb_light.png" /></button></a></p>

Boocrobes allows you to read ebooks in the EPUB format using personalised comprehension aids, including when you are offline. The module is a (very slightly) adapted version of the amazing open source javascript "Readium V2" [R2D2BC reader](https://github.com/d-i-t-a/R2D2BC) developed by Aferdita Muriqi, with the addition of the special Transcrobes sauce that connects you to the model the system has of your language knowledge. The integration is not yet perfect, so you may need to refresh the page occasionally if the formatting does something strange.

## Configuring Boocrobes
Boocrobes can be configured to use different [glossing types](/page/software/configure/glossing), and the reader can also be configured with dark/light mode, font size, different font styles and in paginated or scrolling mode (per book chapter).

## Using Boocrobes

The system currently supports importing non-DRM-protected ebooks in the widely used EPUB format. [The Calibre eBook application](https://calibre-ebook.com/) allows the import/export of many different formats, including importing some DRM-protected books that can then be exported to non-DRM-protected EPUB. Please make sure to comply with any local laws in the place you live when converting ebooks from one format to another. We are currently working on getting a Transcrobes community site going but in the meantime see the [Calibre help](https://calibre-ebook.com/help) for any help on converting other formats to EPUB.

Importing will analyse the book, giving you important information about the unique benefits and challenges you will face with this particular book, at this particular point in your learning journey. 

You can then see information about the content of the book and read the book using the `boocrobes` reading interface, which you can access from the [Contents menu](/page/software/configure/contents). 

<img style="max-width:70%" src="/img/contents/contents-show1.png"/>

The Show Content view also shows your progress concerning the vocabulary of the book (and soon grammar) over the last two months. This will give you some idea how difficult the book might be, and how might expect to progress if you keep up your current study practices!

<img style="max-width:70%" src="/img/contents/contents-show2.png"/>

### After transcrobing
With the information the system has about your knowledge of a language, glosses (and more soon) are added just for the words that you don't know, allowing fluid and enjoyable reading.

<img style="max-width:70%" src="/img/boocrobes/3body1.png"/>
<br/>

### Popup for the word "总部" (headquarters) + sentence translation
<img style="max-width:70%" src="/img/boocrobes/3body2.png"/>
<br/>

The interface is designed to provide the exact same experience you get when reading a webpage or watching a movie, so you can do everything here too, including looking up any word, looking up sentence translations, changing the glossing type, adding vocabulary to your active learning, etc.

Vocabulary that appears regularly will be recognised, and you can then indicate to the system to stop glossing, actively starting the learning trajectory for the item in question.
