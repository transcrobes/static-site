---
title: Exporting user data
comments: false
---

You can currently export all the data that the system records and processes about your activity on the platform. These are exported in CSV format, and could be used in a spreadsheet app like Google Sheets or Microsoft Excel for making more complicated graphs than we provide today. Don't forget to [send us your suggestions](/page/contact) if you think you have a graph that others might like, so we can implement it directly on the platform.

# Export formats

## Export per word activity data

Filename: word\_stats.csv

| Column name | Comments |
|----------|-------------|
| graph | The word |
| nbChecked | The number of times you have checked the word. Note this includes any time it has been glossed automatically for you. |
| nbSeenSinceLastCheck | The number of times you have seen the words since you last looked it up or were shown the gloss |
| nbSeen | The total number of times the system has shown you the word |
| lastChecked | The date of the last time you looked up the word or were shown a gloss |
| lastSeen | The date of the last time you saw the word (that the system knows about!) |
| lastRevisionDate | The date of the *last* time you reviewed the word (any card) in [Repetrobes](/page/software/learn/repetrobes) |
| firstRevisionDate | The date of the *first* time you reviewed the word (any card) in [Repetrobes](/page/software/learn/repetrobes) |
| firstSuccessDate | The date of the first time time you *successfully* reviewed the word (any card) in [Repetrobes](/page/software/learn/repetrobes), or clicked on one of the smileys in any of the content interfaces. This is typically considered the day the system first thinks you [know the word](/post/knowing-a-word) |
| dueDate | The date of the next time you should review the word (any card) in [Repetrobes](/page/software/learn/repetrobes) |

## Export per day activity data

Filename: day\_stats.csv

| Column name | Comments |
|----------|-------------|
| date | The day of the statistics |
| nbSeen | The total number of words seen on the day |
| nbChecked | The total number of words checked on the day |
| nbSuccess | The total number of words revised in [Repetrobes](/page/software/learn/repetrobes) on the day |
| nbFailures | The total number of words re-revised/failed in [Repetrobes](/page/software/learn/repetrobes) on the day |

## Export all Repetrobes card data

Filename: card\_stats.csv

| Column name | Comments |
|----------|-------------|
| graph | The word |
| cardType | The card type, one of the available types: GRAPH SOUND MEANING PHRASE |
| front | Personalised value for the "front" (inspired by Anki) of the MEANING card. Later you will be able to personalise both front and back for all cards, and do more complex generation |
| lastRevisionDate | The date of the last time you reviewed the card |
| firstRevisionDate | The date of the first time you reviewed the card |
| firstSuccessDate | The date of the first time you reviewed the card successfully |
| dueDate | The date of the next time you should review the card |
| interval | [Supermemo 2](https://en.wikipedia.org/wiki/SuperMemo#Description_of_SM-2_algorithm)-inspired "interval" value |
| repetition | [Supermemo 2](https://en.wikipedia.org/wiki/SuperMemo#Description_of_SM-2_algorithm)-inspired "repetition" value |
| efactor | [Supermemo 2](https://en.wikipedia.org/wiki/SuperMemo#Description_of_SM-2_algorithm)-inspired "efactor" value |


