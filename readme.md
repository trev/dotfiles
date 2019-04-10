# Trev's dotfiles

## Usage (cause I'll forget):
I'm trialling [Neovim](https://neovim.io/). Neovim supports, amongst other things, asynchrony.

### Starting from a fresh system?

* Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* Install [iTerm2](https://www.iterm2.com/)
* Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) and enable [Python in Neovim](https://neovim.io/doc/user/nvim_python.html)
* Install [chruby](https://github.com/postmodern/chruby) and check the notes at the bottom of this readme (you only have to set the source for now as once the `.zshrc` is cloned all the settings are taken care of)
* Install [ruby-install](https://github.com/postmodern/ruby-install) and a version of ruby `ruby-install ruby --latest`
* Install [ctags](http://ricostacruz.com/til/navigate-code-with-ctags.html) with `$ brew install ctags`
* Install NodeJS with [n-install](https://github.com/mklement0/n-install)
* Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to speed up CtrlP in Vim
* Set a default system-wide Ruby to use: `echo "ruby-2.4.2" > ~/.ruby-version`
* Exit everything, restart iTerm2

### Link up dot files and setup
* `$ cd ~`
* `$ gem install dottor`
* `$ git clone git://github.com/trev/dotfiles.git`
* `$ cd dotfiles`
* `$ dottor symlink default`
* (nvim) `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim`
* (nvim) `$ nvim +PluginInstall +qall` (Ignore the error)
* (nvim) `$ cd ~/.config/nvim/bundle/YouCompleteMe && ./install.py --tern-completer`
* Double click on the font and install
* Change iTerm2 font to the newly installed font
* Apply iTerm2 color presets: `Preferences->Profiles->Colors->Load Presets`
* `$ vim`
* Exit everything, restart iTerm2
* Drink

### chruby notes
* [Auto-switching](https://github.com/postmodern/chruby) should already be setup in the .zshrc file, but good to be aware of it.
* Check and apply the [integrations](https://github.com/postmodern/chruby#integration) of choice
* Especially important is to complete the [Vim](https://github.com/postmodern/chruby/wiki/Vim) integration or Vim will run using the system Ruby and cause all sorts of problems with plugins like rails.vim.
* Git is aliased to [Hub](https://github.com/github/hub) which adds some syntax sugar to git. Install it with brew: `$ brew install hub`

Finally, some [good reading](https://github.com/sstephenson/rbenv/wiki/Unix-shell-initialization) about shell initialization and the $PATH variable

### Vim/Nvim Plugin notes
I tried [Unite](https://github.com/Shougo/unite.vim) and addons... whilst it looks awesome it was just too slow.
There's also [Deoplete](https://github.com/Shougo/deoplete.nvim) which provides async autocompletion on Neovim but I couldn't get it to work properly.
In the end I stayed with good ol' [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) because it's much faster and just "feels" better. I use CtrlP to fuzzy search through my files, MRU, buffers and tags. I use <C-p> to activate the fuzzy search and <C-f> to change the source (Files, MRU, buffers, tags).
