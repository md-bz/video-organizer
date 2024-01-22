#!/usr/bin/env bash

video=*.mkv

# Check if there are any matching video files
list=($ls $video)
if [[ "${list[0]}" == "*.mkv" ]]; then
    echo "No matching video files found."
    exit 1
fi


# Normalize file names

rename -a " " _ $video
rename -a . _ $video
rename -l _ . *_mkv

# Remove _0 created by download manager 
# rename -l "_0" "" $video

# Get a list of unique video names without season and episode numbers
list=($ls $video)
readarray -t unique_names < <(for file in "${list[@]}"; do echo "${file%[Ss][0-9]*[Ee][0-9]*}"; done | grep '')

# Organize files based on unique names
for item in "${unique_names[@]}"; do
    # Skip consecutive duplicates
    [[ "${item}" == "${last}" ]] && continue
    last=${item}

    # Create directory and move files
    dir="${item%?}"
    dir="${dir//_/ }"
    mkdir -p "$dir"
    dir="${dir// /\ }"
    mv "${item}"* "$dir"

    cd "$dir" || exit 1

    # Organize files within each directory by season
    while true; do
        list=(*.mkv)
        if [[ $list =~ [Ss]([0-9]+)[Ee]([0-9]+) ]]; then
            season=${BASH_REMATCH[1]}
            mkdir -p "S${season}"
            mv *"${season}"*.mkv "S${season}"
        else
            break
        fi
    done

    cd ..
done
