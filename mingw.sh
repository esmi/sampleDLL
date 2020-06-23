#!/usr/bin/env bash

#example:
# you can: $ ln -s `pwd`/mingw.sh /to/your/search/path
# run: $ mingw.sh gcc --version
#


function showhelp() {
  cat <<EOF

  usage:
  $0 [ gcc | g++ ] options...

  #example:
    $ mingw.sh gcc --version
    $ mingw.sh gcc --help

  # you can: $ ln -s `pwd`/mingw.sh /to/your/search/path
  # and run: $ mingw.sh gcc --version

EOF
}

argc=$#

if [ $argc -eq 0 ]; then
  showhelp
else
  dir=/usr/bin
  mingw=i686-w64-mingw32

  if [ -x $dir/$mingw-$1 ]; then
    $dir/$mingw-$*
  else
    echo $dir/$mingw-$1 is not executable!
  fi
fi
