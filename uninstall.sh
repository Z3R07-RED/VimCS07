#!/bin/bash
#Coded by Z3R07-RED on Nov 30 2020

#Define colors
W='\033[0m\e[0m'
N='\e[0;30m\033[1m'
R='\e[0;31m\033[1m'
G='\e[0;32m\033[1m'
Y='\e[0;33m\033[1m'
B='\e[0;34m\033[1m'
M='\e[0;35m\033[1m'
C='\e[0;36m\033[1m'
#

echo $(clear)
if [[ -d ~/.vim ]]; then
    rm -rf ~/.vim
	echo -e "${W}~/${R}.vim${R}   [${Y}OK${R}]${W}"
	sleep 0.2
fi

if [[ -f ~/.vimrc ]]; then
    rm -rf ~/.vimrc
	echo -e "${W}~/${R}.vimrc${R} [${Y}OK${R}]${W}"
	sleep 0.2
fi

mkdir ~/.vim
echo -e "${W}~/${B}.vim${R}   [${Y}OK${R}]${W}"
sleep 0.2
#if [[ -f ~/.vimrc.old ]]; then
#    mv ~/.vimrc.old ~/.vimrc
#    echo -e "${W}~/${W}.vimrc${R} [${Y}OK${R}]${W}"
#fi

echo ""
source banner/VimCS07
echo -ne "${Y}--[ Coded by Z3R07-RED ]--${W}\n\n"
echo "Done!"
echo ""
# VimCS07
