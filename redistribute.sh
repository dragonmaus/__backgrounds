#!/bin/sh

find *.*\ \(*_*\) \( -not \( -name .st\* -prune \) \) -type f | while read f
do
	eval $(gm identify -format 'w=%w\nh=%h' "$f" 2> /dev/null)
	r=$(ratio $w $h | sed 's/(1)$/(1:1)/' | tr : _)
	g=$r/$w'x'$h/${f#*/*/}
	if [ "$f" != "$g" ]
	then
		mkdir -p -v "$(dirname "$g")"
		mv -f -v "$f" "$g"
	fi
done
