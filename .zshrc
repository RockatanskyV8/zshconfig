CONF_FOLDER="$HOME/.config/zsh"
## Options section
source "$CONF_FOLDER/options"
## Keybindings section
source "$CONF_FOLDER/keys"
# End of lines configured by zsh-newuser-install
## Shortcuts
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
## Alias
[ -f "$CONF_FOLDER/aliases" ] && source "$CONF_FOLDER/aliases"
## Theming section  
source "$CONF_FOLDER/theming"
## Prompt
source "$CONF_FOLDER/prompt"
## Git
source "$CONF_FOLDER/git_config"
## Color man pages
source "$CONF_FOLDER/manpage_color"
## Plugin Section
source "$CONF_FOLDER/plugins"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "$file"
}
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucas/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall

