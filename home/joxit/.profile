# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# JDK 6
# export PATH=$PATH:/usr/share/jdk/jdk6/bin
# JDK 7
# export PATH=$PATH:/usr/share/jdk/jdk7/bin
# JDK 8
export PATH=/usr/share/jdk/jdk8/bin:$PATH

export JAVA_HOME=/usr/share/jdk/jdk8/
export STUDIO_JDK=/usr/share/jdk/jdk8/

# Cargo for rust-lang
export PATH="$HOME/.cargo/bin:$PATH"
