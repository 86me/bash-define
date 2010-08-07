#!/bin/bash

# bash-define: Allows dictionary lookups from the terminal.
# Any dictd server can be used in place of dict.org
#
# Copyright (c) 2010 Egon Hyszczak <gone404@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

define() {
    local ret
    local lines=0
    local match
    local url="dict://dict.org"
    if [ $# -eq 0 ]; then
        echo "Usage: 'define word'"
        echo "Use specific database: 'define word db'"
        echo "Get listing of possible databases: 'define showdb'"
        echo "Word match: 'define word-part match-type' (suf, pre, sub, re)"
        echo "Suffix, prefix, substring, regular expression respectively"
        echo "If you use regular expression matching: 'define ^s.*r$ re'"
    fi
    if [ $# -eq 1 ]; then
        if [ $1 == "showdb" ]; then
            ret="`curl -# ${url}/show:db|tail -n +3|head -n -2|sed 's/^110.//'`"
        else
            #Lookup word
            ret="`curl -# ${url}/d:$1|tail -n +3|head -n -2|sed 's/^15[0-2].//'`"
        fi
    fi
    if [ $# -eq 2 ]; then
        case "$2" in
        "suf")
            #Match by suffix
            match="suffix"
            ret="`curl -# ${url}/m:$1::${match}|tail -n +3|head -n -2|sed 's/^15[0-2].//'`"
        ;;
        "pre")
            #Match by prefix
            match="prefix";
            ret="`curl -# ${url}/m:$1::${match}|tail -n +3|head -n -2|sed 's/^15[0-2].//'`"
        ;;
        "sub")
            #Match by substring
            match="substring";
            ret="`curl -# ${url}/m:$1::${match}|tail -n +3|head -n -2|sed 's/^15[0-2].//'`"
        ;;
        "re")
            #Regular expression match
            match="re";
            ret="`curl -# ${url}/m:$1::${match}|tail -n +3|head -n -2|sed 's/^15[0-2].//'`"
        ;;
        *)
            #Use specific databse for lookup
            ret="`curl -# ${url}/d:$1:$2|tail -n +3|head -n -2|sed 's/^[1-2]5[0-2].//'`"
        ;;
        esac
    fi

    lines=`echo "${ret}"|grep -c -`

    #Output
    if [ ${lines} -gt 4 ]; then
        #Use less if more than 4 definitions
        echo "${ret}"|less -R
    else
        echo "${ret}"
    fi
}

thesaurus() {
    define $1 moby-thes
}
