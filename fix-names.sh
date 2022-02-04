#!/bin/sh

find *\ \(*\) \( -not \( -name .st\* -prune \) \) -type f | while read f
do
	eval $(gm identify -format 'w=%w\nh=%h' "$f")
	r=$(ratio $w $h | tr : _)
	g=$r/${w}x$h/${f#*/*/}
	if [ "$f" != "$g" ]
	then
		mkdir -pv "$(dirname "$g")"
		mv -fv "$f" "$g"
	fi
done
