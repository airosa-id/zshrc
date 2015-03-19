autoload -U colors select-word-style
colors	#Colors
select-word-style bash	#ctrl+w on words

export EDITOR="vim"

##
# Completion
## 
# Дополнение по TAB
autoload -Uz compinit && compinit
# completion dot-files
_comp_options+=(globdots)


setopt complete_aliases		# Complete aliases
setopt always_to_end	# when completing from the middle of a word, move the cursor to the end of the word

zstyle ':completion:*' completer _expand _complete _ignored _approximate #list of completers to use
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' verbose yes
# Add color to Completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle :compinstall filename '/home/VIVAIT/r.ainetdinov/.zshrc'

##
# HISTORY
##

HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999

setopt extended_history		# Добавляет в историю время выполнения комманды
setopt inc_append_history      	# append history except that new line are added
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions

##
# VARIOUS
##

setopt chase_links              # resolve symlinks
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'


#PROMPT
color="green"
if [ "$EUID" -eq 0 ]; then
	color="red"
fi
PROMPT="[%T]%{$fg[$color]%}%n %{$fg[blue]%}%~ %#%{$reset_color%} "

alias ls='ls --color=auto --group-directories-first --all --classify -l'
alias tail='multitail'
alias df='df -h'
alias du='du -h --max-depth=1 | sort -h'

#Color Grep and add yellow color
export GREP_COLORS="mt=33"
export GREP_OPTIONS="--color=auto"

# Export java option IPv4 Preference
export _JAVA_OPTIONS="-Djava.net.preferIPv4Stack=true"

# key bindings
# How know:  cat > /dev/null and print Key
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
bindkey "^[[3~" delete-char
bindkey "^[[2~" quoted-insert
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-delete-word
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
