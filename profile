# environment customizations
export CLICOLOR=True # to enable color in terminal
export EDITOR="/usr/local/bin/mate -w" # to enable using of TextMate in terminal workflows
export IDID

# support for TOPCAT command-line tools
export PATH=S/Applications/TOPCAT.app/Contents/Resources/bin:$PATH

# support for Skim's command-line tools
export PATH=/Applications/TeX/Skim.app/Contents/SharedSupport:$PATH

# support for nteract's and other command-line tools in ~/.local/bin
export PATH=~/.local/bin:$PATH

## aliases
# please, sudo
function please() {
  if [[ -z ${1} ]]; then
    sudo $(fc -ln -1)
  else
    sudo ${1}
  fi
}

alias 'please,'='please'
alias 'please…'='please'
alias 'please...'='please'
alias plz=please

## helper functions
# PDF manual
pdfman() {
	tmp_dir="/tmp"
	ps_name="$tmp_dir/man-$1.ps"
	man -t "$1" > "$ps_name" # get PS version of man page in /tmp
	if [ -s "$ps_name" ]
		then {
			pdf_name="$tmp_dir/man-$1.pdf"
			ps2pdf "$ps_name" "$pdf_name"
			open -a Preview "$pdf_name"
		} 
	fi
}

prince_wiki() {
	url="https://en.wikipedia.org/wiki/$1"
	file="$HOME/Downloads/$1.pdf"
	#wiki_css_url="http://www.princexml.com/howcome/2008/wikipedia/wiki2.css"
	wiki_css_url="$HOME/wikipedia_prince.css"
	prince --no-author-style -s $wiki_css_url $url -o $file
	open -a Preview $file
}

# cdf (cd to file)
cdf() {
	dest_dir=$(dirname "$1")
	cd "$dest_dir"
}

# System Volumes Data size
dfdata() {
	df -h /System/Volumes/Data
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

# Test Connectivity using Apple's Captive Portal
test_tcp ()  {
  captive_html=`curl -s -L http://captive.apple.com`
  lowercase_html=$(echo "$captive_html" |  tr '[:upper:]' '[:lower:]' )
  if [[ $lowercase_html == *"success"* ]]; then
    echo "Connected"
  else
    echo "Not Connected"
  fi
}

# Edit/Wait
editw () {
  for file in "$*"; do
    mate -w "$file"
  done
}

# search: sourced from other file
. ~/.search_functions.sh

# setup MacPorts
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
#export MANPATH="/opt/local/share/man:$MANPATH"

# setup CPAN
#PATH="/Users/j.santander-vela/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/Users/j.santander-vela/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/Users/j.santander-vela/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/Users/j.santander-vela/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/j.santander-vela/perl5"; export PERL_MM_OPT;

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# Fortune with a Docker twist
export FORTUNE=`fortune`
docker run docker/whalesay cowsay -W 69 "$FORTUNE"
#say -v Alex "$FORTUNE" &

# Setup Java for Antlr
#export CLASSPATH=".:/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH"
#alias antlr4='java -jar /usr/local/lib/antlr-4.8-complete.jar'
#alias grun='java org.antlr.v4.gui.TestRig'
