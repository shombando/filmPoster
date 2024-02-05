# Film Poster
A Gum powered interactive Bash script to create Hugo film photo posts in a section called `film`. This can be adapted for any kind of a post-type where the user wants to be prompted for specific tags that are defined in plain-text files. 

## Demo
<svg fill="none" viewBox="0 0 600 300" width="600" height="300" xmlns="http://www.w3.org/2000/svg">
  <foreignObject width="100%" height="100%">
    <div xmlns="http://www.w3.org/1999/xhtml">
      <style>
        .container {
          display: flex;
          width: 100%;
          height: 400px;
        }
      </style>

	  <div class="container">
		  <video controls width="800">
			  <source src="./filmPosterDemo.webm" type="video/webm" />
			  <p>Alt-text:Screencapture of a terminal window side by side with a browser window. The terminal is demonstrating an application that enters information about at photo like title, film, camera, etc. and then selects the file from a file picker. Once the process is completed the browser auto refreshes to show the new photo has been added to the grid and then the photo page is loaded showing the different tags via clicking a few tags it is demonstrated that they were generated and linked with other posts.</p>
		  </video>
	  </div>
    </div>
  </foreignObject>
</svg>
## Motivation
I didn't have a good process to add film photos to my Hugo static site with consistent tags to serve as metadata for camera, film, developer, format, etc. so I cobbled together a small Bash script to collect some input and create a folder as a Hugo `page bundle` but it was a very manual process still and the tag template soon became tedious to maintain.
I discovered [Gum](https://github.com/charmbracelet/gum) and decided to play with it to see if it would improve my post creation experience and it has been pretty good during my brief testing.

## Dependencies
- Bash
- [Gum](https://github.com/charmbracelet/gum)
- Hugo binary is **not** required to be installed locally

## Installation
### Gum
Install Gum using [instructions](https://github.com/charmbracelet/gum#installation) found in the Gum repo.

### Film Poster
Recommended install location is in the Hugo site root folder as submodule. You could also copy just the `filmPoster.sh` file and create your own text files so any future updates upset your customization.

``` sh
git submodule add https://github.com/shombando/filmPoster.git
git submodule init
```

## Configuration
### filmPoser.sh
- Relative output dir from where this script/repo exists. Change the last part of the path from `film` to whatever you want to call your Hugo section.
  - `OUTPUT_DIR="../content/film"`

- Default starting directory for locating Photos
  - `PHOTOS_DIR=~/Pictures`
  
### Text files
Update all the text files with the information that is relevant for you. They're populated with my personal choice and I plan on using this repo to keep my personal configuration so it'll change and grow over time.

All files will accept a new entry per line. These will be generated as Hugo tags so it's recommended that they do not contain spaces.
- cameras.txt 
- developers.txt
- filmstocks.txt
- format.txt
- labs.txt

## Usage
Call the script `./filmPoster.sh` and use arrow navigation keys or type in the filter list for fuzzy matching. Gum also support vim keys for navigation including in the file browser (`h` for up one level and `l` for drilling down).
