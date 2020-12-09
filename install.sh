#!/bin/bash
#VimCS07
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
#VARIABLES:
termux_path="/data/data/com.termux/files/usr/bin"
kali_linux_path="/usr/bin"
program_name="VimCS07"
author="Z3R07-RED"
version="0.1"
vimrc=".vimrc"
vimrc_plugin=".vimrc_plugin"
colors_tmes="colors"
dir_plugin="plugin"
PWD=$(pwd)

#FUNCTIONS:
function ncurses_utils(){
if [ ! "$(command -v tput)" ]; then
	echo -e "\n${Y}[I]${W} apt install ncurses-utils ...${W}"
	apt install ncurses-utils -y > /dev/null 2>&1
	sleep 1
fi
}

# dependencies
function dependencies(){
if [[ -d "$termux_path" ]]; then
	ncurses_utils
fi
tput civis; counter_dn=0
echo $(clear);sleep 0.3
printf "${R}┌──────────────────────────────────────┐${W}\n"
printf "${R}│      COMUNIDAD CLUB SECRETO 07       │${W}\n"
printf "${R}└──────────────────────────────────────┘${W}\n"
printf "\n${W}\e[1;36m$program_name - version $version${W}\n"
printf "${W}\e[1;32mCoded by ${W}\033[41;33;1m$author${W}${G} on Nov 30 2020${W}\n"
echo ""
sleep 0.2
spinner=("${Y}||" "${Y}//" "${Y}--" "${Y}OK")
spinner2=("${Y}||" "${Y}//" "${Y}--" "${R}..")
dependencies=(vim python python2 git ctags fzf curl wget) # dependencies
for program in "${dependencies[@]}"; do
    if [ ! "$(command -v $program)" ]; then
		for SPMP in ${spinner2[@]}; do
			printf "\r${G}|${W}\033[41;37;1m%12s${W}${G}|>----------- [${W} ${SPMP} ${G}]${W}" $program
			sleep 0.2
		done
		sleep 1
		echo -e "\n"
        let counter_dn+=1
		echo -e "${Y}[i]${C} INSTALLING $program ${W}...${W}"
		echo ""
		apt install $program -y
		echo ""
	else
		for SPMP in ${spinner[@]}; do
			printf "\r${G}|${W}\033[41;37;1m%12s${W}${G}|>----------- [${W} ${SPMP} ${G}]${W}" $program
			sleep 0.2
		done
		sleep 0.3
		echo -e "\n"
    fi
done
sleep 1
echo $(clear);tput cnorm
}

dependencies

if [[ -f "banner" && -x "banner" ]]; then
	source banner
else
	chmod +x banner/VimCS07
	source banner/VimCS07
fi
if [[ -f "uninstall.sh" && -x "uninstall.sh" ]]; then
    sleep 0.1
else
    chmod +x uninstall.sh
fi
sleep 1
echo -e "${Y}[${G}+${Y}] INSTALACION DE FLACKE8 ...${W}"
echo ""
pip install flake8
sleep 0.5
printf "\n${Y}[${C}*${Y}]${G} Configurando vim...${W}\n"
sleep 0.3
printf "\n${Y}[${G}+${Y}]${W} Configurando .vimrc...${W}\n"
if [[ -f ~/.vimrc ]]; then
	if [[ ! -f ~/.vimrc.old && ! -f "vim.log" ]]; then
		mv ~/.vimrc ~/.vimrc.old
		sleep 0.2
	fi
	cat "${vimrc_plugin}" > ~/.vimrc
else
    cat "${vimrc_plugin}" > ~/.vimrc
fi
echo "1" > vim.log
sleep 1
printf "\n${Y}[${G}+${Y}]${W} Configurando colors...${W}\n"
sleep 0.3
if [[ ! -d ~/.vim/colors ]]; then
    mkdir -p ~/.vim/colors
    sleep 0.3
fi
cp "$colors_tmes"/*.vim ~/.vim/colors/
sleep 1
if [[ ! -f ~/.vim/plugin/color_sample_pack.vim ]]; then
	printf "\n${Y}[${G}+${Y}]${W} Configurando color_sample_pack.vim...${W}\n"
	sleep 0.3
	if [[ ! -d ~/.vim/plugin ]]; then
		mkdir -p ~/.vim/plugin
	fi
	cp "${dir_plugin}"/*.vim ~/.vim/plugin/
fi
sleep 1
printf "\n${Y}[${G}+${Y}]${W} Instalando Vundle.vim...${W}\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1
sleep 0.2
echo ""
echo -ne "${Y}[Download]${C} pathogen ...${W}"
echo ""
sleep 0.3
mkdir -p ~/.vim/autoload && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
sleep 0.2
go_back=`pwd`
cd  ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
sleep 0.2
cd "$go_back"

printf "\n${Y}[${G}+${Y}]${W} Instalando Plugins...${W}\n"
sleep 0.2
printf "\nLa instalación puede tardar unos minutos ...\n"
vim +PluginInstall +qall > /dev/null 2>&1

rm ~/.vimrc
cat "${vimrc}" > ~/.vimrc
echo $(clear)
source banner/VimCS07
sleep 0.2
echo -ne "${Y}--[ Coded by Z3R07-RED ]--${W}\n\n"
echo "Done!"
#exit 0
