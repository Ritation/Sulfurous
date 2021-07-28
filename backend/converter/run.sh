#!/bin/bash
    echo "CHECKING FOR WORK..."
    for entry in ./sb3/*.sb3; do 
		echo "Search file"
		echo "$entry"
		if [ "$entry" != "./sb3/*.sb3" ]
        then
			echo "Found file"
            sb3name="$(cut -d'/' -f3 <<<"$entry")"
            sb2name="./sb2/$(cut -d'.' -f1 <<<"$sb3name").sb2"
            echo "WORK: $sb3name"
            echo "$sb2name"
            python3 ./converter/sb3tosb2.py "-c" "$entry" "$sb2name"
            rm "$entry"
        fi
        echo "NO WORK"
    done
	sleep 1
done