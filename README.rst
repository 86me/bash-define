bash-define
===========

This script allows for dictionary *(dictd)* lookups via the terminal.

Features
--------

Prefix, suffix, substring, and regular expression matching are all supported.

Example of regex match:
    ``define '^sub.*er$' re``

    Returns::
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
        ...  


Requirements
------------

Basic Unix utilities:
    head, tail, grep, sed, less, and curl


Installation
------------

Copy bash-define.sh to the location of your choice and call it from your ~/.bashrc or ~/.zshrc file with:
    ``source bash-define.sh``


Notes
-----

- Modified to work with zsh.

- The sed commands get rid of the dictd status codes. If you know of a way to reduce redunancy please let me know!

- Released under MIT license.

- Feel free to make modification and improvements. If you do, post them to bash-define on github so I can make use of them as well.

- Supports multiple different databses **(define showdb)**::

    72 databases present  
    gcide "The Collaborative International Dictionary of English v.0.48"  
    wn "WordNet (r) 3.0 (2006)"  
    moby-thesaurus "Moby Thesaurus II by Grady Ward, 1.0"  
    elements "The Elements (07Nov00)"  
    vera "V.E.R.A. -- Virtual Entity of Relevant Acronyms (January 2014)"  
    jargon "The Jargon File (version 4.4.7, 29 Dec 2003)"  
    foldoc "The Free On-line Dictionary of Computing (20 July 2014)"  
    easton "Easton's 1897 Bible Dictionary"  
    hitchcock "Hitchcock's Bible Names Dictionary (late 1800's)"  
    bouvier "Bouvier's Law Dictionary, Revised 6th Ed (1856)"  
    devil "The Devil's Dictionary (1881-1906)"  
    world02 "CIA World Factbook 2002"  
    gaz2k-counties "U.S. Gazetteer Counties (2000)"  
    gaz2k-places "U.S. Gazetteer Places (2000)"  
    gaz2k-zips "U.S. Gazetteer Zip Code Tabulation Areas (2000)"  
    fd-tur-eng "Turkish-English FreeDict Dictionary ver. 0.2.1"  
    fd-por-deu "Portuguese-German FreeDict Dictionary ver. 0.1.1"  
    fd-nld-eng "Dutch-English Freedict Dictionary ver. 0.1.3"  
    fd-eng-ara "English-Arabic FreeDict Dictionary ver. 0.6.2"  
    fd-spa-eng "Spanish-English FreeDict Dictionary ver. 0.1.1"  
    fd-eng-hun "English-Hungarian FreeDict Dictionary ver. 0.1"  
    fd-ita-eng "Italian-English FreeDict Dictionary ver. 0.1.1"  
    fd-wel-eng "Welsh-English Freedict dictionary"  
    fd-eng-nld "English-Dutch FreeDict Dictionary ver. 0.1.1"  
    fd-fra-eng "French-English FreeDict Dictionary ver. 0.3.4"  
    fd-tur-deu "Turkish-German FreeDict Dictionary ver. 0.1.1"  
    fd-swe-eng "Swedish-English FreeDict Dictionary ver. 0.1.1"  
    fd-nld-fra "Nederlands-French FreeDict Dictionary ver. 0.1.1"  
    fd-eng-swa "English-Swahili xFried/FreeDict Dictionary"  
    fd-deu-nld "German-Dutch FreeDict Dictionary ver. 0.1.1"  
    fd-fra-deu "French-German FreeDict Dictionary ver. 0.1.1"  
    fd-eng-cro "English-Croatian Freedict Dictionary"  
    fd-eng-ita "English-Italian FreeDict Dictionary ver. 0.1.1"  
    fd-eng-lat "English-Latin FreeDict Dictionary ver. 0.1.1"  
    fd-lat-eng "Latin-English FreeDict Dictionary ver. 0.1.1"  
    fd-fra-nld "French-Dutch FreeDict Dictionary ver. 0.1.2"  
    fd-ita-deu "Italian-German FreeDict Dictionary ver. 0.1.1"  
    fd-eng-hin "English-Hindi FreeDict Dictionary ver. 1.5.1"  
    fd-deu-eng "German-English FreeDict Dictionary ver. 0.3.3"  
    fd-por-eng "Portuguese-English FreeDict Dictionary ver. 0.1.1"  
    fd-lat-deu "Latin - German FreeDict dictionary ver. 0.4"  
    fd-jpn-deu "Japanese-German FreeDict Dictionary ver. 0.1.1"  
    fd-eng-deu "English-German FreeDict Dictionary ver. 0.3.5"  
    fd-eng-scr "English-Serbo-Croat Freedict dictionary"  
    fd-eng-rom "English-Romanian FreeDict Dictionary ver. 0.6.1"  
    fd-iri-eng "Irish-English Freedict dictionary"  
    fd-cze-eng "Czech-English Freedict dictionary"  
    fd-scr-eng "Serbo-Croat-English Freedict dictionary"  
    fd-eng-cze "English-Czech fdicts/FreeDict Dictionary"  
    fd-eng-rus "English-Russian FreeDict Dictionary ver. 0.3"  
    fd-afr-deu "Afrikaans-German FreeDict Dictionary ver. 0.3"  
    fd-eng-por "English-Portuguese FreeDict Dictionary ver. 0.2.2"  
    fd-hun-eng "Hungarian-English FreeDict Dictionary ver. 0.3"  
    fd-eng-swe "English-Swedish FreeDict Dictionary ver. 0.1.1"  
    fd-deu-ita "German-Italian FreeDict Dictionary ver. 0.1.1"  
    fd-cro-eng "Croatian-English Freedict Dictionary"  
    fd-dan-eng "Danish-English FreeDict Dictionary ver. 0.2.1"  
    fd-eng-tur "English-Turkish FreeDict Dictionary ver. 0.2.1"  
    fd-eng-spa "English-Spanish FreeDict Dictionary ver. 0.2.1"  
    fd-nld-deu "Dutch-German FreeDict Dictionary ver. 0.1.1"  
    fd-deu-por "German-Portuguese FreeDict Dictionary ver. 0.2.1"  
    fd-swa-eng "Swahili-English xFried/FreeDict Dictionary"  
    fd-hin-eng "English-Hindi Freedict Dictionary [reverse index]"  
    fd-deu-fra "German-French FreeDict Dictionary ver. 0.3.1"  
    fd-eng-fra "English-French FreeDict Dictionary ver. 0.1.4"  
    fd-slo-eng "Slovak-English Freedict dictionary"  
    fd-gla-deu "Scottish Gaelic-German FreeDict Dictionary ver. 0.1.1"  
    fd-eng-wel "English-Welsh Freedict dictionary"  
    fd-eng-iri "English-Irish Freedict dictionary"  
    english "English Monolingual Dictionaries"  
    trans "Translating Dictionaries"  
    all "All Dictionaries (English-Only and Translating)"  


License
--------
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

