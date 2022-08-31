export EDITOR="/usr/local/bin/mate -w" # to enable using of TextMate in terminal workflows
export IDID

# support for TOPCAT command-line tools
export PATH=/Applications/TOPCAT.app/Contents/Resources/bin:$PATH

# support for Skim's command-line tools
export PATH=/Applications/TeX/Skim.app/Contents/SharedSupport:$PATH

# support for nteract's and other command-line tools in ~/.local/bin
export PATH=~/.local/bin:$PATH

## aliases
# please, sudo
function please
  if test -z $argv
    eval command sudo $history[1]
  else
    sudo $argv
  end
end

alias 'please,'='please'
alias 'please…'='please'
alias 'please...'='please'
alias plz=please

## helper functions
# PDF manual
function pdfman 
	tmp_dir="/tmp"
	ps_name="$tmp_dir/man-$argv.ps"
	man -t "$argv" > "$ps_name" # get PS version of man page in /tmp
	if test -s "$ps_name"
		pdf_name="$tmp_dir/man-$argv.pdf"
		ps2pdf "$ps_name" "$pdf_name"
		open -a Preview "$pdf_name"
	end
end

function prince_wiki
	url="https://en.wikipedia.org/wiki/$argv"
	file="$HOME/Downloads/$argv.pdf"
	#wiki_css_url="http://www.princexml.com/howcome/2008/wikipedia/wiki2.css"
	wiki_css_url="$HOME/wikipedia_prince.css"
	prince --no-author-style -s $wiki_css_url $url -o $file
	open -a Preview $file
end

# cdf (cd to file)
function cdf
	dest_dir=$(dirname "$argv")
	cd "$dest_dir"
end

# System Volumes Data size
function dfdata
	df -h /System/Volumes/Data
end

# manual in TextMate
function mateman
	man "$argv" | col -b | mate
end

# Quit an OS X application from the command line
function quit
	for app in "$argv"
		echo Quitting $app
		cmd='quit app "'$app'"'
		osascript -e "$cmd"
	end
end

# Start Vidyo
function vidyoit
	open -a VidyoDesktop
	open -a 'Google Chrome' $(pbpaste)
end

# Test Connectivity using Apple's Captive Portal
function test_tcp
  captive_html=$(curl -s -L http://captive.apple.com)
  lowercase_html=$(echo "$captive_html" |  tr '[:upper:]' '[:lower:]' )
  if test $lowercase_html == *"success"*
    echo "Connected"
  else
    echo "Not Connected"
  end
end

# Edit/Wait
function editw
  for file in "$argv"
    mate -w "$file"
  end
end

# search: sourced from other file
source ~/.search_functions.fish

# Fortune with a Docker twist
export FORTUNE=$(fortune)
docker run docker/whalesay cowsay -W 69 "$FORTUNE"
#say -v Alex "$FORTUNE" &


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/juandediossantander/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

