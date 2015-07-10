# Trev's dotfiles

Usage (cause I'll forget):

* `$ cd ~`
* `$ mkdir "${HOME}/.npm-packages"`
* `$ gem install dottor`
* `$ git clone git://github.com/trev/dotfiles.git`
* `$ cd dotfiles`
* `$ dottor symlink default`
* `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* `$ vim +PluginInstall +qall`
* Double click on the font and install
* Change iTerm2 font to the newly installed font
* `$ vim`
* Exit everything, restart iTerm2
* Drink

Ok, now that you've had a drink, time to get some sexy Ruby loving

* Install [chruby](https://github.com/postmodern/chruby)
* Don't foget to setup [auto-switching](https://github.com/postmodern/chruby)
* Check and apply the [intergations](https://github.com/postmodern/chruby#integration) of choice
* Especially important is to complete the [Vim](https://github.com/postmodern/chruby/wiki/Vim) integration or Vim will run using the system Ruby and cause all sorts of problems with plugins like rails.vim.
* Git is aliased to [Hub](https://github.com/github/hub) which adds some syntax sugar to git. Install it with brew: `$ brew install hub`

Finally, some [good reading](https://github.com/sstephenson/rbenv/wiki/Unix-shell-initialization) about shell initialization and the $PATH variable
