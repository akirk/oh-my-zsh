function display_host() {
	m=%m
	echo -n "%{$fg[magenta]%}"
	if [ "$USER" = "root" ]; then
		echo -n "%{$bg[red]%}%{$fg[white]%}root@%{$reset_color%}%{$fg[magenta]%}%m:"
	elif [ "$USER" != "$DEFAULT_USER" ]; then 
		echo -n "$USER@%m:"
	elif [ "$m" != "$DEFAULT_HOST" ]; then
		echo -n "$m:"
	fi
	echo -n "%{$reset_color%}"
}

PROMPT='$(display_host)%{$fg[blue]%}%1~ %(?,%{$fg[green]%},%{$fg[red]%})$ '
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='%{$fg[blue]%}%4~$(git_prompt_info) %{$fg[white]%}%D{%R}%{$reset_color%}'

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
