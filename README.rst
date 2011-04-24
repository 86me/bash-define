===========
bash-define
===========

This script allows for dictionary *(dictd)* lookups via the terminal.

Supports multiple different databses **(define showdb)**
    ::
    gcide "The Collaborative International Dictionary of English v.0.48"
    wn "WordNet (r) 2.0"
    moby-thes "Moby Thesaurus II by Grady Ward, 1.0"
    elements "Elements database 20001107"
    vera "Virtual Entity of Relevant Acronyms (Version 1.9, June 2002)"
    jargon "Jargon File (4.3.1, 29 Jun 2001)"
    foldoc "The Free On-line Dictionary of Computing (27 SEP 03)"
    easton "Easton's 1897 Bible Dictionary"
    hitchcock "Hitchcock's Bible Names Dictionary (late 1800's)"
    bouvier "Bouvier's Law Dictionary, Revised 6th Ed (1856)"
    devils "THE DEVIL'S DICTIONARY ((C)1911 Released April 15 1993)"
    world02 "CIA World Factbook 2002"
    gazetteer "U.S. Gazetteer (1990)"
    gaz-county "U.S. Gazetteer Counties (2000)"
    gaz-place "U.S. Gazetteer Places (2000)"
    gaz-zip "U.S. Gazetteer Zip Code Tabulation Areas (2000)"
    afr-deu "Africaan-German Freedict dictionary"
    afr-eng "Africaan-English Freedict Dictionary"
    ara-eng "English-Arabic Freedict Dictionary"
    cro-eng "Croatian-English Freedict Dictionary"
    cze-eng "Czech-English Freedict dictionary"
    dan-eng "Danish-English Freedict dictionary"
    deu-eng "German-English Freedict dictionary"
    deu-fra "German-French Freedict dictionary"
    deu-ita "German-Italian Freedict dictionary"
    deu-nld "German-Nederland Freedict dictionary"
    deu-por "German-Portugese Freedict dictionary"
    eng-afr "English-Africaan Freedict Dictionary"
    eng-ara "English-Arabic FreeDict Dictionary"
    eng-cro "English-Croatian Freedict Dictionary"
    eng-cze "English-Czech fdicts/FreeDict Dictionary"
    eng-deu "English-German Freedict dictionary"
    eng-fra "English-French Freedict Dictionary"
    eng-hin "English-Hindi Freedict Dictionary"
    eng-hun "English-Hungarian Freedict Dictionary"
    eng-iri "English-Irish Freedict dictionary"
    eng-ita "English-Italian Freedict dictionary"
    eng-lat "English-Latin Freedict dictionary"
    eng-nld "English-Netherlands Freedict dictionary"
    eng-por "English-Portugese Freedict dictionary"
    eng-rom "English-Romanian FreeDict dictionary"
    eng-rus "English-Russian Freedict dictionary"
    eng-spa "English-Spanish Freedict dictionary"
    eng-swa "English-Swahili xFried/FreeDict Dictionary"
    eng-swe "English-Swedish Freedict dictionary"
    eng-tur "English-Turkish FreeDict Dictionary"
    eng-wel "English-Welsh Freedict dictionary"
    fra-deu "French-German Freedict dictionary"
    fra-eng "French-English Freedict dictionary"
    fra-nld "French-Nederlands Freedict dictionary"
    hin-eng "English-Hindi Freedict Dictionary [reverse index]"
    hun-eng "Hungarian-English FreeDict Dictionary"
    iri-eng "Irish-English Freedict dictionary"
    ita-deu "Italian-German Freedict dictionary"
    jpn-deu "Japanese-German Freedict dictionary"
    kha-deu "Khasi-German FreeDict Dictionary"
    lat-deu "Latin-German Freedict dictionary"
    lat-eng "Latin-English Freedict dictionary"
    nld-deu "Nederlands-German Freedict dictionary"
    nld-eng "Nederlands-English Freedict dictionary"
    nld-fra "Nederlands-French Freedict dictionary"
    por-deu "Portugese-German Freedict dictionary"
    por-eng "Portugese-English Freedict dictionary"
    sco-deu "Scottish-German Freedict dictionary"
    scr-eng "Serbo-Croat-English Freedict dictionary"
    slo-eng "Slovenian-English Freedict dictionary"
    spa-eng "Spanish-English Freedict dictionary"
    swa-eng "Swahili-English xFried/FreeDict Dictionary"
    swe-eng "Swedish-English Freedict dictionary"
    tur-deu "Turkish-German Freedict dictionary"
    tur-eng "Turkish-English Freedict dictionary"
    english "English Monolingual Dictionaries"
    trans "Translating Dictionaries"
    all "All Dictionaries (English-Only and Translating)"
    web1913 "Webster's Revised Unabridged Dictionary (1913)"
    world95 "The CIA World Factbook (1995)"


Features
========

Prefix, suffix, substring, and regular expression matching are all supported.

Example of regex match:
    $ define ^sub.*er$ re

    Returns:
        ::
        23 matches found
        gcide "Subalmoner"
        gcide "Subcaliber"
        gcide "Subchanter"
        gcide "Subduer"
        gcide "Subinfer"
        gcide "Subject-matter"
        gcide "Subjoinder"
        gcide "Sublimer"
        gcide "Subminister"
        gcide "Submitter"
        gcide "Subofficer"
        gcide "Suborder"
        gcide "Suborner"
        gcide "Subpurchaser"
        gcide "Subreader"
        gcide "Subscriber"
        gcide "Subtilizer"
        gcide "Subtler"
        gcide "Subtracter"
        gcide "Subtreasurer"
        gcide "Suburb roister"
        gcide "Subverter"
        gcide "Subworker"


Requirements
============

Basic Unix utilities:
    head, tail, grep, sed, less, and curl


Installation
============

Copy bash-define.sh to the location of your choice and call it from your ~/.bashrc or ~/.zshrc file with 'source bash-define.sh'

Notes
=====

- Modified to work with zsh.

- The sed commands get rid of the dictd status codes. If you know of a way to reduce redunancy please let me know!

- Released under MIT liscence. 

- Feel free to make modification and improvements. If you do, post them to bash-define on github so I can make use of them as well.

Liscense
========
Copyright (c) 2010 Egon Hyszczak <gone404@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

