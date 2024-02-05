#!/usr/bin/env bash 
set -euo pipefail

#Recommended install location in Hugo root as submodule
#Relative output dir from where this application exists
OUTPUT_DIR="../content/film"

#Default starting directory for locating Photos
PHOTOS_DIR=~/Pictures

COLOR_MUTED=#778899
COLOR_HIGHLIGHT=#ff2244

colorText() {
	gum style \
		--foreground="$2" \
		"$1"
}

filmPost() {
	gum style \
		--border normal \
		--border-foreground $COLOR_MUTED \
		--margin 2 \
		--padding 1 \
		--align center \
		--width 50 \
		"$(colorText "🎞" $COLOR_HIGHLIGHT) Film Poster"
}

pickOption() {
	file=$1
	cat $file | gum filter --sort --indicator="➜"
}

getInput() {
	#$1 can't contain spaces, not sure how to escape spaces
	gum input --placeholder "please enter $(colorText $1 $COLOR_MUTED)"
}

pickChroma() {
	gum choose "color" "b&w"
}

pickProcess() {
	echo "Who developed the film?" >&2 #suppress string from being returned
	choice=$(gum choose "Home" "Lab")

	case $choice in
		Home)
			echo "developer/$(pickOption "./developers.txt")"
			;;
		Lab)
			echo "lab/$(pickOption "./labs.txt")"
			;;
	esac
}

appendPost() {
	echo $1 >> index.md
}

#Collect information from user 
echo "$(filmPost)"
chroma=$(pickChroma)
format=$(pickOption "./format.txt")
camera=$(pickOption "./cameras.txt")
film=$(pickOption "./filmstocks.txt")
process=$(pickProcess)

#Reset window
clear
echo "$(filmPost)"

title=$(getInput 'title')
slug=$(echo $title | sed "s/[^[:alnum:]-]/-/g")
altText=$(getInput 'alt-text')
echo "Select photo file $(colorText 'use vim navigation' $COLOR_MUTED)"
filePath=$(gum file ${PHOTOS_DIR})
fileName=$(basename ${filePath})

#Form and create post directory
postDate=$(date '+%Y-%m-%d')
photoDir="${OUTPUT_DIR}/${postDate}_${slug}"
mkdir -p ./$photoDir
cd ./$photoDir
cp "${filePath}" ./

#Create post markdown file as a page bundle
$(appendPost "---")
$(appendPost "title: \"$title\"")
$(appendPost "date: $postDate")
$(appendPost "description: \"$altText\"")
$(appendPost "tags:")
$(appendPost "- $chroma")
$(appendPost "- format/$format")
$(appendPost "- camera/$camera")
$(appendPost "- film/$film")
$(appendPost "- $process")
$(appendPost "resources:")
$(appendPost "- film/src:./$fileName")
$(appendPost "---")

echo "$postDate: $camera shot $title on $format using $film: $filePath"

