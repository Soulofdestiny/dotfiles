source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/dotfiles/zsh-git-prompt/zshrc.sh
#source "$HOME/.antigen/antigen.zsh"

#antigen-use oh-my-zsh
#antigen-bundle arialdomartini/oh-my-git
#antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

#antigen-apply


LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS


# Set up the prompt

autoload -Uz promptinit
autoload -U colors && colors
promptinit
#prompt adam1

#PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m:%{$fg_no_bold[yellow]%}%~%{$reset_color%}%B$(git_super_status) # "
PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m:%{$fg_no_bold[yellow]%}%~%{$reset_color%}%b$(git_super_status) % # '
#RPROMPT="[%{$fg_no_bold[yellow]%}%*%{$reset_color%}]"

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#aliases
alias c='clear'
alias -g ll='ls -lh'
alias la='ls -lah'
alias -g l='ls | less'
alias 'cd..=cd ..'
alias gc='gcc-c++ -o'
alias -g ncpp='sh ~/Scripts/cpp_file.sh'
alias -g nsh='sh ~/Scripts/bash_file.sh'
alias -g ncc='sh ~/Scripts/c_file.sh'
alias chrome='google-chrome-stable'
alias mcd='mkdir $1 && cd $1'
alias gu='git fetch upstream && git merge upstream/master && git push'
alias gp='/suse/mgriessmeier/Scripts/getparm.pl'

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
#alias 'cp=cp -i'

#django
alias 'dj=python manage.py'

