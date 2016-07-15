#!/bin/bash

pwd=`pwd`

for i in "$@"; do
	filedir=$(dirname "$i")
	filename=$(basename "$i")
	if [ ${filedir:0:1} == "/" ]; then
		outdir="$filedir/converted"
	else
		outdir="$pwd/$filedir/converted"
	fi
	mkdir -p "$outdir"
	sox "$i" -G -b 16 "$outdir/$filename" rate -v -L 44100 dither
	if [ $? -eq 0 ]; then
		echo "$outdir/$filename" created successfully
	else
		echo "Error creating $outdir/$filename. Stopping."
		exit -1
	fi
done
