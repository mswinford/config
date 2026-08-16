# History options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups

# The following lines were added by compinstall
zstyle :compinstall filename '/home/michael/.config/zsh/completion.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.config/zsh/completion.zsh

# PATH
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/neovim/bin

# Activate Antidote
source ~/.antidote/antidote.zsh
# Initialize plugins
antidote load ~/.config/zsh/plugins.antidote.txt

# bind keys for zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Load all alias files from the config directory
# After plugin loading to prevent custom aliases from being overridden
for alias_file in ~/.config/zsh/aliases/*.zsh; do
    source "$alias_file"
done

# Activate mise
eval "$(~/.local/bin/mise activate zsh)"

# Activate Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/starfield.omp.json)"

export EDITOR='nvim'
export VISUAL='nvim'

# pnpm
export PNPM_HOME="/home/michael/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
