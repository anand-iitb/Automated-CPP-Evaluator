#!/bin/bash
if  [ $# -eq 2 ]

  then
          wget -r -np -nH -R index.html.tmp -R index.html $1 --cut-dirs=$2
          link="$1"
          link_last_part="$(basename -- $link)"
          mv $link_last_part mock_grading
  else
        echo 'Usage: bash download.sh <link to directory> <cut-dirs argument>'
        exit 1
fi