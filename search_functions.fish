# This script only works in Mac OS X, due to the dependency 
# on the `open` command.
# It can be directly added into a .profile file, either
# by copying and pasting its content, or sourcing the
# file:
# source search_functions.fish


# Usage: duck any search terms
# Result: default browser opens with a query on any
# search terms provided in DuckDuckGo; you can even add
# search selector 
function duck
   open "https://duckduckgo.com/?q=$argv"
end

# Usage: duckit
# Result: default browser opens with a query on the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; duckit
function duckit
   duck $(pbpaste)
end

# Usage: google any search terms
# Result: default browser opens with a query on any
# search terms provided; you can even add Google operators, 
# such as inurl, site, filetype...
function google
   open "https://encrypted.google.com/search?q=$argv"
end

# Usage: googleit
# Result: default browser opens with a query on the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; googleit
function googleit
   google $(pbpaste)
end


# Usage: gmap any search terms
# Result: default browser opens with a Google Maps
# search on any search terms provided
function gmap
   open "https://encrypted.google.com/maps/preview?q=$argv"
end

# Usage: gmapit
# Result: default browser opens with a Google Maps
# search on the text version of the pasteboard content
function gmapit
   gmap $(pbpaste)
end


# Usage: map any search terms
# Result: Apple Maps application opens
# searching on any search terms provided
function map
   open "http://maps.apple.com/?q=$argv"
end

# Usage: mapit
# Result: Apple Maps application opens
# searching on the text version of the pasteboard content
function mapit
   map $(pbpaste)
end

# Usage: maproute start end
# Result: Apple Maps application opens
# showing routes betwen start and end
# 
function maproute
   open "http://maps.apple.com/?saddr=$1&daddr=$2"
end


# Usage: wiki any search terms
# Result: default browser opens with a search in
# Wikipedia on any search terms provided; 
# you can even add Bing operators
function wiki
   open "https://en.wikipedia.org/w/index.php?search=$argv"
end

# Usage: wikit
# Result: default browser opens with a query 
# to the search in Wikipedia using the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; wikit
function wikit
   wiki $(pbpaste)
end


# Usage: bing any search terms
# Result: default browser opens with a Bing query on any
# search terms provided; you can even add Bing operators
function bing
   open "https://www.bing.com/search?q=$argv"
end

# Usage: bingit
# Result: default browser opens with a query 
# to the Bing search engine on the
# text version of the pasteboard; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; bingit
function bingit
   bing $(pbpaste)
end


# Usage: wolfram any search terms
# Result: default browser opens with a query 
# to Wolfram|Alpha on any search terms provided
function wolfram
   open "https://www.wolframalpha.com/input/?i=$argv"
end

# Usage: wolframit
# Result: default browser opens using the 
# text version of the pasteboard to perform a 
# query on Wolfram|Alpha; if you copy a file
# in the Finder, for instance, the search will be
# performed on the filename, not on the file content;
# to search for file content, you can do:
# cat file | pbcopy ; wolframit
function wolframit
   wolfram $(pbpaste)
end