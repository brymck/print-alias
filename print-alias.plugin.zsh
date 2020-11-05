_print-alias () {
    # Constants
    local -r PREFIX=${PRINT_ALIAS_PREFIX:-}
    local -r ALIAS_FORMAT=${PRINT_ALIAS_FORMAT:-$'\e[36m'}
    local -r NON_ALIAS_FORMAT=${PRINT_NON_ALIAS_FORMAT:-$'\e[2m'}
    local -r RESET_COLORS=$'\e[0m'
    local -r IGNORE_ALIASES=(${PRINT_ALIAS_IGNORE_ALIASES:-})
    local -r IGNORE_REDEFINED_COMMANDS=${PRINT_ALIAS_IGNORE_REDEFINED_COMMANDS:-'false'}

    local -a words
    words=( ${(z)BUFFER} )

    local -r first_word=${words[1]}
    if [[ ${IGNORE_ALIASES[(ie)$first_word]} -le ${#IGNORE_ALIASES} ]]; then
        return
    fi

    if [[ "$(whence -w $first_word 2>/dev/null)" == "${first_word}: alias" ]]; then
        shift words
        local -r aliased_command=($(whence $first_word))
        if [[ $IGNORE_REDEFINED_COMMANDS == 'true' ]]; then
            if [[ $first_word == ${aliased_command[1]} ]]; then
                return
            fi
        fi
        echo -nE $'\n'"${PREFIX}${ALIAS_FORMAT}${aliased_command}${RESET_COLORS}"
        for word in $words; do
            echo -nE " ${NON_ALIAS_FORMAT}${word}${RESET_COLORS}"
        done
    fi
}

zle -N accept-line _print-alias-accept-line
_print-alias-accept-line () {
    emulate -L zsh
    _print-alias
    zle .accept-line
}

zle -N accept-line _print-alias-accept-line
