# Adding fortune
fortune -s

# environment customizations
export CLICOLOR=True # to enable color in terminal

# support for TOPCAT command-line tools
export PATH=/Applications/TOPCAT/bin:$PATH

# support for Skim's command-line tools
export PATH=/Applications/Skim.app/Contents/SharedSupport:$PATH

## helper functions
# PDF manual
pdfman() {
	tmp_dir="/tmp"
	ps_name="$tmp_dir/"man-"$1".ps
	man -t $1 > $ps_name # get PS version of man page in /tmp
	if [ -s $ps_name ]
		then {
			pdf_name="$tmp_dir/"man-"$1".pdf 
			ps2pdf "$ps_name" "$pdf_name"
			open -a Preview "$pdf_name"
		} 
	fi
}

# cdf (cd to file)
cdf() {
	dest_dir=`dirname "$1"`
	cd "$dest_dir"
}

# manual in TextMate
mateman() { man "${1}" | col -b | mate; };

# Quit an OS X application from the command line
quit () {
    for app in "$*"; do
		echo Quitting $app
		cmd='quit app "'$app'"'
        osascript -e "$cmd"
    done
}

# Start Vidyo
vidyoit () {
	open -a VidyoDesktop
	open -a 'Google Chrome' `pbpaste`
}


# search: sourced from other file
. ~/.search_functions.sh

# setup MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"


# Added by Canopy installer on 2014-05-29
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/j.santander-vela/Library/Enthought/Canopy_64bit/User/bin/activate

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
