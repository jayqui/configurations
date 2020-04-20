# Setting up Vim

*Disclaimer: Vim is a very broad and versatile tool that people use in wildly different ways. The configuration and plugins described in this documentation reflect the usage patterns of only a select few services engineers, and very well could seem incorrect to other engineers. More controversial configuration lines in the vimrc below have been commented out, activate them at your own preferences.*

(NOTE ON RESOURCES: We have some copies of vim books in Romaine or in the services section. Hit up the #services-team slack channel if you want to borrow a book or need other vim resources. Also, in addition to a web search, there's [[https://github.com/EbookFoundation/free-programming-books/blob/master/free-programming-books.md#vim|this]])

## Clearing other package managers

- If you've previously used pathogen or another package manager, you'll need to clear them for the instructions below to work. This can be done with the following commands:
  - `mv ~/.vim ~/.xvim`
  - `mv ~/.vimrc ~/.xvimrc`
  - `mkdir ~/.vim`

## Download Minpac

 Minpac is a lightweight and nifty package manager built on new packaging capabilities introduced in Vim 8. This plugin essentially will
 let you automatic grab all other plugins you will need simply by loading the godvimrc file.

 - Create the optional plugin directory for minpac: `mkdir -p ~/.vim/pack/minpac/opt/`

 - Get minpac:
    - `cd ~/.vim/pack/minpac/opt`
    - `git clone https://github.com/k-takata/minpac.git`
  - Pull dotfiles into your workspace directory: `git clone git@github.com:omadahealth/dotfiles.git`
  - Copy dotfiles/rc\_files/vimrc\_files/godvimrc into your vimrc: `cp dotfiles/rc_files/vimrc_files/godvimrc ~/.vimrc`
  - OPEN  A FILE WITH VIM, then run the command `:PackUpdate`
  - Run the post-setup script: `sh ~/workspace/dotfiles/script/godvim-post-setup.sh`

To be able to copy/paste between vim and your system clipboard, you'll need a version of vim with +clipboard, which you can install with `brew install vim`

## Usage

- Fuzzy search: `<C-p>`
  - Open searched file in current buffer: `<CR>`
  - Open searched file in new split: `<C-x>`
  - Open searched file in new vertical split: `<C-v>`
- Project directory tree: `<C-n>`
  - Open project directory tree and drop down to current working directory: `f<C-n>`
- Most recently used files list: <leader>m
- Flip to test file: ":A"
- Run tests in file: `t<C-f>` (must be within a spec file to work)
- Run last test: `t<C-l>`
- Track vim session: `":Obssess"`
  - Open vim with the saved tracking session: `"vim -S"`
- `"<leader>*"` to do a project-wide search against the word under the cursor

## Project-wide search and replace:
  - "<leader>f 'element\_to\_search'", Hit ENTER when prompted
  - `":copen"` to check list of files that will be iterated through
  - `":ccl"` to close quickfix list of files
  - `":cdo` %s/element\_to\_search/element\_to\_replace/gc | update"
