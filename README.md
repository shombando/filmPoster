# Film Poster
A Gum powered interactive Bash script to create Hugo photo posts in a section called `film`. By default it is targeted for Film photography posts, but this script can be adapted for any kind of a post-type where the user wants to be prompted for specific tags that are defined in plain-text files. This repo is meant to be a standalone demonstration, you'll want to customize your seleection options from the defaults.

## Demo
![Screencapture of a terminal window side by side with a browser window. The terminal is demonstrating an application that enters information about photo like title, film, camera, etc. and then selects the file from a file picker. Once the process is completed the browser auto refreshes to show the new photo has been added to the grid and then the photo page is loaded showing the different tags, via clicking a few tags it is demonstrated that they were generated and linked with other posts.](./filmPosterDemo.gif "1 min filmPoster showing usage and results")

Higher quality webm demo file is on [my website](https://shom.dev/posts/20240204_filmposter-with-gum-hugo-photo-post-bliss/) if listening to the audio of a mechanical keyboard clacking away is your thing!

## Motivation
I didn't have a good process to add film photos to my Hugo static site with consistent tags to serve as metadata for camera, film, developer, format, etc. so I cobbled together a small Bash script to collect some input and create a folder as a Hugo `page bundle` but it was a very manual process still and the tag template immediately became tedious to maintain.
I discovered [Gum](https://github.com/charmbracelet/gum) and decided to play with it to see if it would improve my post creation experience and it has been pretty good during my brief testing.

## Dependencies
- Bash
- [Gum](https://github.com/charmbracelet/gum)
- Hugo binary is **not** required to be installed locally

## Installation
### Gum
Install Gum using [instructions](https://github.com/charmbracelet/gum#installation) found in the Gum repo.

### Film Poster
Recommended install location is in the Hugo site root folder as `git submodule`. You could also copy just the `filmPoster.sh` file and create your own text files so any future updates to this repo doesn't upset your customizations.

``` sh
git submodule add https://github.com/shombando/filmPoster.git
git submodule init
```

## Configuration
### filmPoser.sh
- Path of the output folder that will be created (a Hugo [Page Bundle](https://gohugo.io/content-management/page-bundles/)), from where this script/repo exists. Change the last part of the path from `film` to whatever you want to call your Hugo section. Note: this script assumes that the section (folder) exists. If it doesn't then just drop a file called `_index.md` in that section (folder) and it will create a list of posts. If you want the same layout as the demo gif, put [these files here](../shom.dev/tree/main/layouts/film) into the `/layouts/film` folder.
  - `OUTPUT_DIR="../content/film"`

- Default starting directory for locating Photos
  - `PHOTOS_DIR=~/Pictures`
  
### Text files
`⚠️ Warning`The options that show up in the prompts are defined in the *.txt files. Because this repo is meant to be a standalone demo the configuration is checked in but ideally those options would be customized by you. Just know if that you use this repo "in production" (which is absolutely not recommended) and theny you do customize and run an update on this submodule you will see conflicts. They're populated with my personal choice and I plan on using this repo to keep my personal configuration so it'll change and grow over time.
Update all the text files with the information that is relevant for you. 

All files will accept a new entry per line. These will be generated as Hugo tags so they should not contain spaces.
- cameras.txt 
- developers.txt
- filmstocks.txt
- format.txt
- labs.txt

## Usage
Call the script `./filmPoster.sh` and use arrow navigation keys or type in the filter list for fuzzy matching. Gum also support vim keys for navigation including in the file picker (`h` for up one level and `l` for drilling down).
