#!/bin/sh
sed -i \
         -e 's/#17171c/rgb(0%,0%,0%)/g' \
         -e 's/#f2f2e9/rgb(100%,100%,100%)/g' \
    -e 's/#17171c/rgb(50%,0%,0%)/g' \
     -e 's/#cca37a/rgb(0%,50%,0%)/g' \
     -e 's/#212126/rgb(50%,0%,50%)/g' \
     -e 's/#f2f2e9/rgb(0%,0%,50%)/g' \
	"$@"