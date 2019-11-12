_print-alias-accept-line () {
    emulate -L zsh

    # Constants
    local -r ALIAS_FORMAT=$'\e[36m'
    local -r NON_ALIAS_FORMAT=$'\e[2m'
    local -r RESET_COLORS=$'\e[0m'

    local -a words
    words=( ${(z)BUFFER} )

    local -r first_word=${words[1]}
    if [[ "$(whence -w $first_word 2>/dev/null)" == "${first_word}: alias" ]]; then
        shift words
        echo -nE $'\n'"${ALIAS_FORMAT}$(whence $first_word)${RESET_COLORS}"
        for word in $words; do
            echo -nE " ${NON_ALIAS_FORMAT}${word}${RESET_COLORS}"
        done
    fi
    zle .accept-line
}

zle -N accept-line _print-alias-accept-line
