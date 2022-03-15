---
title: User Dictionaries
comments: false
---

Personalised dictionaries may be imported and used with various parts of the system, including the comprehension aids (glosses, mouseovers, popups, etc.) and active learning tools (Repetrobes, etc.).

The system currently supports importing dictionaries in the CSV format with a fixed format. In-place editing of dictionaries will be made available at a later date.

## Import options

<img src="/img/dictionaries/dict1.png"/>

### Column and field separators

## Import file structure

The files imported MUST be in CSV format (and have a .csv extension) and have the following structure:

### Example lines
    好,,hao3,good/well/proper/good to/easy to/very/so
     好,,hao4,to be fond of/to have a tendency to/to be prone to
     好不,,hao3 bu4,not at all .../how very ...
     好不好,,hao3 bu5 hao3,(coll.) all right?/OK?

### Columns

| Word (obligatory) | POS (optional) | Sound (optional) | Meanings (obligatory) |
|----------|-------------|------|------|

- The optional fields must still be present, in the sense that the file MUST have at least 4 columns for every line

### Column details

| Field/Column | Explanation |
|----------|-------------|
| Word (obligatory) | The exact word string | 
| POS (optional) | Part of speech, considered as "OTHER" if missing | 
| Sound (optional) | Sound in pinyin format (both number "hao3" and accented "hǎo" formats accepted)
| Meanings (obligatory) | One or more English (L1) translations for the word |


## Basic Part of Speech types
The basic part-of-speech types used in the system are the following:

- NOUN: "Noun"
- VERB: "Verb"
- ADJ: "Adjective"
- ADV: "Adverb"
- PREP: "Preposition"
- PRON: "Pronoun"
- CONJ: "Conjunction"
- DET: "Determiner"
- MODAL: "Modal"
- OTHER: "Other"

## Extended Part of Speech types
The system uses the [Chinese parts-of-speech tag set developed by the University of Pennsylvania](https://catalog.ldc.upenn.edu/LDC2013T21) internally for several advanced functions, and you may also use these to help the system to find the best match when looking for glosses for unknown words.

- AD: "Adverb"
- AS: "Aspect Marker"
- BA: "BA-construction"
- CC: "Coordinating conjunction"
- CD: "Cardinal number"
- CS: "Subordinating conjunction"
- DEC: "DE-relative clause"
- DEG: "DE-associative"
- DER: "DE-V-de-R"
- DEV: "DE-before verb"
- DT: "Determiner"
- ETC: '"etc" marker'
- FW: "Foreign word"
- IJ: "Interjection"
- JJ: "Adjective"
- LB: 'Long "BEI"'
- LC: "Localizer"
- M: "Measure word"
- MSP: "Other particle"
- NN: "Common noun"
- NR: "Proper noun"
- NT: "Temporal noun"
- OD: "Ordinal number"
- ON: "Onomatopoeia"
- P: 'Preposition (excl "and")'
- PN: "Pronoun"
- PU: "Punctuation"
- SB: 'Short "BEI"'
- SP: "Phrase-final particle"
- VA: "Predicative adjective"
- VC: "Copula verb",
- VE: "YOU as main verb"
- VV: "Other verb"
- URL: "URL",
