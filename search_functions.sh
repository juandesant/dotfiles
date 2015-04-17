# This script only works in Mac OS X, due to the dependency 
# on the `open` command.
# It can be directly added into a .profile file, either
# by copying and pasting its content, or sourcing the
# file:
# . search_functions.sh


# Usage: google any search terms
# Result: default browser opens with a query on any
# search terms provided; you can even add Google operators, 
# such as inurl, site, filetype...
function google {
   open "https://encrypted.google.com/search?q=$*"
}

# Usage: googleit
# Result: default browser opens with a query on the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; googleit
function googleit {
   google `pbpaste`
}


# Usage: gmap any search terms
# Result: default browser opens with a Google Maps
# search on any search terms provided
function gmap {
   open "https://www.google.com/maps/preview?q=$*"
}

# Usage: gmapit
# Result: default browser opens with a Google Maps
# search on the text version of the pasteboard content
function gmapit {
   gmap `pbpaste`
}


# Usage: map any search terms
# Result: Apple Maps application opens
# searching on any search terms provided
function map {
   open "http://maps.apple.com/?q=$*"
}

# Usage: mapit
# Result: Apple Maps application opens
# searching on the text version of the pasteboard content
function mapit {
   map `pbpaste`
}

# Usage: maproute start end
# Result: Apple Maps application opens
# showing routes betwen start and end
# 
function maproute {
   open "http://maps.apple.com/?saddr=$1&daddr=$2"
}


# Usage: wiki any search terms
# Result: default browser opens with a search in
# Wikipedia on any search terms provided; 
# you can even add Bing operators
function wiki {
   open "http://en.wikipedia.org/w/index.php?search=$*"
}

# Usage: wikit
# Result: default browser opens with a query 
# to the search in Wikipedia using the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; wikit
function wikit {
   wiki `pbpaste`
}


# Usage: bing any search terms
# Result: default browser opens with a Bing query on any
# search terms provided; you can even add Bing operators
function bing {
   open "http://www.bing.com/search?q=$*"
}

# Usage: bingit
# Result: default browser opens with a query 
# to the Bing search engine on the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; bingit
function bingit {
   bing `pbpaste`
}


# Usage: wolfram any search terms
# Result: default browser opens with a query 
# to Wolfram|Alpha on any search terms provided
function wolfram {
   open "http://www.wolframalpha.com/input/?i=$*"
}

# Usage: wolframit
# Result: default browser opens using the 
# text version of the pasteboard to perform a 
# query on Wolfram|Alpha; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; wolframit
function wolframit {
   wolfram `pbpaste`
}
