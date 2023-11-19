#!/bin/bash

SubFilePlaylist()
{
    cd "$i"

    for i in ./*; do 

        [[ -d $i ]] && SubFilePlaylist "$i"  && continue
        [[ $i == $patt1 ]] || 
        [[ $i == $patt2 ]] ||
        [[ $i == $patt3 ]] ||
        [[ $i == $patt4 ]] ||
        [[ $i == $patt5 ]] &&
        echo "$(pwd)/${i}" >> "$(pwd).m3u" &&
        names+=("$(pwd)/${i}")

    done

    mv "$(pwd).m3u" "$(pwd)/"

    cd ..
}

declare -a names=() 

patt1="*.mkv*"
patt2="*.mp4*"
patt3="*.mp3*"
patt4="*.webm*"
patt5="*.avi*"

touch "$(pwd).m3u"

for i in ./*; do
        
    [[ -d $i ]] && SubFilePlaylist "$i" && continue
    [[ $i == $patt1 ]] || 
    [[ $i == $patt2 ]] ||
    [[ $i == $patt3 ]] ||
    [[ $i == $patt4 ]] ||
    [[ $i == $patt5 ]] &&
    echo "$(pwd)/${i}" >> "$(pwd).m3u"

done

for i in "${names[@]}"; do 
    
    echo "${i}" >> "$(pwd).m3u"

done

mv "$(pwd).m3u" "$(pwd)/"