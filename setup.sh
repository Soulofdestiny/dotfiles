#!/bin/sh

#########################################################################
#### Matthias Grießmeier ################################################
###### Suse Linux GmbH ########### Tue Apr 19 14:37:44 CEST 2016 ########
#### mgriessmeier@suse.com ##############################################
#########################################################################
### This script creates symlinks from ~ to any dotfiles in ~/dotfiles ###
#########################################################################


validate_script_call () {
    if [ $# -ne 1 ]
    then
        echo "Usage: ./stow.sh <hostdir>"
        exit
    fi

    hostdir=$1
    dotfile_dir="$HOME/dotfiles"

    ls $dotfile_dir | grep $hostdir
    if [ $? -ne 0 ]
    then
        echo "no config for host $hostdir found"
        exit
    fi
}

check_for_dependencies () {
    deps=(zsh dunst compton rofi terminator vim)
    deps_to_install=()


    for dep in ${deps[@]}
    do
        :
        echo $dep
        rpm -qi --quiet $dep
        if [ $? -eq 0 ]
        then
            continue
        elif [ $? -eq 1 ]
        then
            deps_to_install+=" " 
            deps_to_install+=$dep 
        else
            echo "Error occured"
        fi
    done

    # install all deps that are not installed
    if [ -z "$deps_to_install" ]
    then
        echo "All dependencies are already installed"
    else
        echo "Installing dependencies..."
        sudo zypper in  ${deps_to_install[@]}
    fi
}

backup_and_link () {
    apps=$(ls $dotfile_dir/$hostdir)
    echo $apps

    for app in ${apps[@]}
    do
        :
        case $app in
            bash)
                cp $HOME/.bashrc $HOME/bashrc.bak
                ln -s $dotfile_dir/$hostdir/bash/bashrc $HOME/.bashrc 
                echo "linking $app config..."
                ;;
            compton)
                cp $HOME/.config/compton.conf $HOME/.config/compton.conf.bak
                ln -s $dotfile_dir/$hostdir/compton/compton $HOME/.config/compton.conf 
                echo "linking $app config..."
                ;;
            dunst)
                cp $HOME/.config/dunst/dunstrc $HOME/.config/dunst/dunstrc.bak
                ln -s $dotfile_dir/$hostdir/dunst/dunstrc $HOME/.config/dunst/dunstrc 
                echo "linking $app config..."
                ;;
            i3)
                echo "i3"
                echo "linking $app config..."
                ;;
            vim)
                echo "vim"
                echo "linking $app config..."
                ;;
            terminator)
                echo "terminator"
                echo "linking $app config..."
                ;;
            zsh)
                echo "zsh"
                echo "linking $app config..."
                ;;
            *)
                echo "$app not found"
        esac
    done
}

validate_script_call $1
check_for_dependencies
backup_and_link


################################## EOF ###################################
