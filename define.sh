#!/bin/sh

# bash-define: Allows dictionary lookups from the terminal.
# Any dictd server can be used in place of dict.org
#
# Copyright (c) 2016 Egon Hyszczak <egon@camperkings.com>
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
    local response=""
    local response_lines=0
    local head_lines=1
    local url="dict://dict.org" #Alternate: dict://dictionary.bishopston.net
    local COLOR=false
    local USE_COLOR=true
    local HIGHLIGHT_COLOR="1;33m"
    local CURL_OPTS="-s"
    local BAD_ARGS=65
    local NO_RESULTS=2
    if [[ `uname` == "Darwin" ]]; then
      local SED_FLAGS="g" #OSX sed doesn't support case insensitive matching
      local HIGHLIGHT_ESCAPE=$'\033['
    else
      local SED_FLAGS="gi"
      local HIGHLIGHT_ESCAPE=$'\x1B['
    fi
    if [[ $(command -v gsed) >/dev/null ]]; then
      local SED_FLAGS="gi"
    fi

    # Check for color support
    [ -x /usr/bin/tput ] && tput setaf 1>&/dev/null && COLOR=true || COLOR=false

    _servercheck() {
        if [`nc -zv -w2 dict.org 2628`]; then
            echo "Port is closed";
        else
            echo "Port is open";
        fi
    }

    _define_usage() {
        echo -e "Usage: 'define word'" >&2
        echo -e "Use specific database: 'define word db'" >&2
        echo -e "Get listing of possible databases: 'define showdb'" >&2
        echo -e "Word match: 'define word-part match-type' (suf, pre, sub, re)" >&2
        echo -e "Suffix, prefix, substring, regular expression respectively" >&2
        echo -e "If you use regular expression matching: define '^s.*r' re" >&2
        unset -f _define_usage
        return 1
    }

    if [ $# -eq 0 ] || [ $# -ge 3 ]; then
        if [ $# -gt 0 ]; then
            echo -e "define: error: too many arguments" >&2
            echo -e $1 $2 $3 $4
            _define_usage
            return ${BAD_ARGS}
        else
            _define_usage
            return 0
        fi
    fi

    if [ $# -eq 1 ]; then
        if [[ $1 == "showdb" ]]; then
            #Show databases
            response="$(curl ${CURL_OPTS} "${url}/show:db")"
        else
            #Lookup word
            response="$(curl ${CURL_OPTS} "${url}/d:$1")"
        fi

    fi

    if [ $# -eq 2 ]; then
        case "$2" in
          #Set match mode
            [Ss][Uu][Ff])
                response="$(curl ${CURL_OPTS} "${url}/m:$1::suffix")"
            ;;
            [Pp][Rr][Ee])
                response="$(curl ${CURL_OPTS} "${url}/m:$1::prefix")"
            ;;
            [Ss][Uu][Bb])
                response="$(curl ${CURL_OPTS} "${url}/m:$1::substring")"
            ;;
            [Rr][Ee])
                response="$(curl ${CURL_OPTS} "${url}/m:$1::re")"
            ;;
            *)
                #Use specific databse for lookup
                response="$(curl ${CURL_OPTS} "${url}/d:$1:$2")"
            ;;
        esac
    fi

    response_lines=$(echo "${response}"| grep -c $)

    # If nothing returned, print error and exit.
    if [[ -z "${response}" || -n $(echo "${response}"| grep 'no match') ]]; then
        echo "No results found." >&2
        return ${NO_RESULTS}
    fi

    if [[ ${response_lines} -gt 4 ]]; then
        head_lines=`expr ${response_lines} - 4`
    fi

    response="$(echo ${response} | tail -n +3 | head -n ${head_lines} | sed 's/^[15][15][0-2].//')"

    #Output
    if [ ${response_lines} -ge ${LINES} ]; then
        #Use $PAGER or less if results are longer than $LINES
        if ${COLOR} && ${USE_COLOR}; then
            echo -e "${response}" | sed 's/\b\('$1'\)\b/'${HIGHLIGHT_ESCAPE}${HIGHLIGHT_COLOR}'\1'${HIGHLIGHT_ESCAPE}'0m/'${SED_FLAGS}'' | ${PAGER:=less -R}
        else
            echo -e "${response}" | ${PAGER:=less -R}
        fi
    else
        if ${COLOR} && ${USE_COLOR}; then
            echo -e "${response}" | sed 's/\b\('$1'\)\b/'${HIGHLIGHT_ESCAPE}${HIGHLIGHT_COLOR}'\1'${HIGHLIGHT_ESCAPE}'0m/'${SED_FLAGS}''
        else
            echo -e "${response}"
        fi
    fi
}

thesaurus() {
    define $1 moby-thesaurus
}

#Tab Completion. Completes words if "/usr/share/dict/words" exists.
#Otherwise just completes options.
[ -f /usr/share/dict/words ] && \
_define() {
    local opts="re sub suf pre"
    if [ $COMP_CWORD -eq 1 ]; then
        if [ -f /usr/share/dict/words ]; then
            if [ ${#COMP_WORDS[COMP_CWORD]} -ge 4 ]; then
                COMPREPLY=($(grep -h "^${COMP_WORDS[COMP_CWORD]}" /usr/share/dict/words < (echo -e "showdb")))
            else
                COMPREPLY=($(compgen -W "showdb" -- "${COMP_WORDS[COMP_CWORD]}"))
            fi
        else
            COMPREPLY=($(compgen -W "showdb" -- "${COMP_WORDS[COMP_CWORD]}"))
        fi
        return 0
    elif [ $COMP_CWORD -ge 2 ]; then
        COMPREPLY=(\
        $(compgen -W "$opts $(define showdb 2>/dev/null | awk '{print $1}' |\
        grep -Ev "\.|--exit--|^[0-9]*$")" -- "${COMP_WORDS[COMP_CWORD]}"))
        return 0
    fi
} && complete -F _define define

[ -f /usr/share/dict/words ] && \
_thesaurus() {
    COMPREPLY=($(grep -h "^${COMP_WORDS[COMP_CWORD]}" /usr/share/dict/words))
    return 0
} && complete -F _thesaurus thesaurus

