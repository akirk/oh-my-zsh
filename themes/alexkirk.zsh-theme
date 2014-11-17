function prompt_char() {
	if [ "$USER" = "root" ]
	then echo "%{$bg[red]%}%{$fg[white]%}$%{$reset_color%}"
	else echo '$';
	fi
}

function display_user() {
	if [ "$USER" != "$DEFAULT_USER" ]
	then echo ":$USER"
	fi
}

PROMPT='%{$fg[blue]%}%1~ %(?,%{$fg[green]%},%{$fg[red]%})$(prompt_char) '
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='%{$fg[blue]%}%4~$(git_prompt_info) %{$fg[magenta]%}%m$(display_user)%{$reset_color%} %{$fg[white]%}%D{%R}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"


cdf () {
	currFolderPath=$( /usr/bin/osascript << EOT
		tell application "Finder"
			try
				set currFolder to (folder of the front window as alias)
			on error
				set currFolder to (path to desktop folder as alias)
			end try
			POSIX path of currFolder
		end tell
EOT
	)
	echo "cd \"$currFolderPath\""
	cd "$currFolderPath"
}
