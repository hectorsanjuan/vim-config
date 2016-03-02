# VIM config (Deprecated in favour of new repo hectorsanjuan/dotvim)

This is my current VIM config. I use pathogen plugin to manage other
and use git submodules to track last versions.

## Install

First of all you must create backup of your current vim configuration:

    $ cd ~
    $ cp .vimrc vimrc.old
    $ mv .vim vim.old

In order to use this vim config on *nix machine you have to clone this
repository:

    $ git clone https://github.com/rincewind1981/vim-config.git ~/.vim

Then you have to create symlinks to vim config file:

    $ ln -s ~/.vim/vimrc ~/.vimrc

Finally you have to switch to .vim directory and fetch plugins:

    $ cd ~/.vim
    $ git submodule init
    $ git submodule update

Or in a one line command:

    $ cd ~/.vim && git submodule update --init

## Update

In order to update any of the installed plugins you have to switch to
plugin folder and fetch it. For example to update fugitive plugin you
have to do:

    $ cd ~/.vim/bundle/fugitive/
    $ git pull origin master

If you want to update all plugins you can do with one single command:

    $ cd ~/.vim && git submodule foreach git pull origin master

