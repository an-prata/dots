#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#17171c/g' \
         -e 's/rgb(100%,100%,100%)/#f2f2e9/g' \
    -e 's/rgb(50%,0%,0%)/#17171c/g' \
     -e 's/rgb(0%,50%,0%)/#cca37a/g' \
 -e 's/rgb(0%,50.196078%,0%)/#cca37a/g' \
     -e 's/rgb(50%,0%,50%)/#212126/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#212126/g' \
     -e 's/rgb(0%,0%,50%)/#f2f2e9/g' \
	"$@"
