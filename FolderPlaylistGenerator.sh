#!/bin/bash

declare -a names=() 

patt1="*.mkv*"
patt2="*.mp4*"
patt3="*.mp3*"
patt4="*.webm*"
patt5="*.avi*"

touch "$(pwd).m3u"

for i in ./*; do

    [[ -d $i ]] && cd "$i" &&
    for j in ./*; do
        [[ $j == $patt1 ]] || 
        [[ $j == $patt2 ]] ||
        [[ $j == $patt3 ]] ||
        [[ $j == $patt4 ]] ||
        [[ $j == $patt5 ]] &&
        echo "$(pwd)/${j}" >> "$(pwd).m3u"&&
        echo "$(pwd)/${j}" >> "$(cd ../ && pwd).m3u"
        
    done 
     
    [[ -f "$(pwd).m3u" ]] && 
    mv "$(pwd).m3u" /"$(pwd)/$(i)/" &&
    cd ..

done

[[ $(cd ../ && pwd) ]] && 
mv "$(cd ../ && pwd).m3u" "$(cd ../ && pwd)/" ||
mv "$(pwd).m3u" "$(pwd)/"