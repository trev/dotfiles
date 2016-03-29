# Trev's dotfiles

## Usage (cause I'll forget):
I'm trialling [Neovim](https://neovim.io/) alongside Vim. Neovim supports, amongst other things, asynchrony.

### Starting from a fresh system?

* Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* Install [iTerm2](https://www.iterm2.com/)
* Install [MacVim](http://stackoverflow.com/questions/21012203/gvim-or-macvim-in-mac-os-x#answer-21012284)
* Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
* Install [chruby](https://github.com/postmodern/chruby) and check the notes at the bottom of this readme
* Install [ruby-install](https://github.com/postmodern/ruby-install) and a version of ruby `ruby-install ruby --latest`
* Install [ctags](http://ricostacruz.com/til/navigate-code-with-ctags.html) with `$ brew install ctags`
* Install [NodeJS](https://nodejs.org/en/download/)
* Set a default system-wide Ruby to use: `echo "ruby-2.2.3" > ~/.ruby-version`
* Exit everything, restart iTerm2

### Link up dot files and setup
* `$ cd ~`
* `$ mkdir "${HOME}/.npm-packages"`
* `$ gem install dottor`
* `$ git clone git://github.com/trev/dotfiles.git`
* `$ cd dotfiles`
* `$ dottor symlink default`
* (vim) `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* (vim) `$ cd ~/.vim/bundle/YouCompleteMe && ./install.py --tern-completer`
* (vim) `$ vim +PluginInstall +qall` (Ignore the error)
* (nvim) `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim`
* (nvim) `$ cd ~/.config/init/nvim/bundle/YouCompleteMe && ./install.py --tern-completer`
* (nvim) `$ nvim +PluginInstall +qall` (Ignore the error)
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
