# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
# Apt aliases
alias aupgrade='sudo apt update && sudo apt full-upgrade'
alias ainstall='sudo apt install'
alias asearch='apt search'
alias aautoremove='sudo apt autoremove'
alias aremove='sudo apt remove'
alias aupdate='sudo apt update'
alias ashow='apt show'
alias apurge='sudo apt purge'
alias areinstall='sudo apt reinstall'
alias alist='apt list --installed'
# Nala aliases
alias nupgrade='sudo nala upgrade'
alias ninstall='sudo nala install'
alias nsearch='nala search'
alias nautoremove='sudo nala autoremove'
alias nremove='sudo nala remove'
alias nupdate='sudo nala update'
alias nshow='nala show'
alias npurge='sudo nala purge'
alias nlist='nala list --installed'
# Anonsurf aliases
alias anstart='sudo anonsurf start'
alias anstop='sudo anonsurf stop'
alias anstatus='sudo anonsurf status'
alias anrestart='sudo anonsurf restart'
alias anmyip='sudo anonsurf myip'
alias ani2pstart='sudo anonsurf starti2p'
alias ani2pstop='sudo anonsurf stopi2p'
# Batcat alias
alias bat='batcat'
# cat alias
alias cat='pygmentize -f 256 -O style=material -g'
# ls alias
alias ls='pwd && lsd -A --group-directories-first'
# micro alias
alias mi='micro'
# tldr listfinder & preview alias
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# Automatically do an ls after each cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && pwd && lsd -A --group-directories-first
  else
    builtin cd ~ && pwd && lsd -A --group-directories-first
  fi
}

# clears the terminal after .zshrc is sourced
clear
