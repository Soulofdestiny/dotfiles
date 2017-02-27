#!/bin/sh

#########################################################################
#### Matthias Grießmeier ################################################
###### Suse Linux GmbH ########### Tue Apr 19 14:37:44 CEST 2016 ########
#### mgriessmeier@suse.com ##############################################
#########################################################################
### This script creates symlinks from ~ to any dotfiles in ~/dotfiles ###
#########################################################################

dir=~/dotfiles/$(hostname)                    # dotfiles directory
olddir=~/dotfiles_old/$(hostname)            # old dotfiles backup directory
files="bashrc vimrc zshrc"        # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    sudo zypper install -n zsh
    install_zsh
fi
}

install_zsh

################################# EOF ###################################
