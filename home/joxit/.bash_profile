# ~/.bash_profile executed by bash(1) for login shell

# JDK 6
# export PATH=$PATH:/usr/share/jdk/jdk6/bin
# JDK 7
# export PATH=$PATH:/usr/share/jdk/jdk7/bin
# JDK 8
export PATH=/usr/share/jdk/jdk7/bin:$PATH



export PATH=~/bin:$PATH
export JAVA_HOME=/usr/share/jdk/jdk7/
export STUDIO_JDK=/usr/share/jdk/jdk7/

if [ -f ~/.bashrc ]; then
   . ~/.bashrc;
fi
