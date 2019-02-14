#!/bin/sh
blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
bin='$PREFIX/bin/'
echo -e $okegreen" [ * ] Updating Termux ..."
pkg update
echo -e $cyan" [ * ] Done !!"
echo -e $okegreen" [ * ] Installing Dependencies ..."
echo -e $okegreen" [ - ] Installing Make ..."
pkg install make -y
echo -e $okegreen" [ - ] Installing Clang ..."
pkg install clang -y
echo -e $okegreen" [ - ] Installing Git ..."
pkg install git -y
echo -e $cyan" [ * ] Done !!"
echo -e $okegreen" [ * ] Getting termux-elf-cleaner Script ..."
git clone https://github.com/Harshiv-Patel/termux-elf-cleaner.git
cd termux-elf-cleaner
echo -e $cyan" [ * ] Done !!"
echo -e $okegreen" [ * ] Building Script ..."
make
echo -e $cyan" [ * ] Done !!"
echo -e $okegreen" [ * ] Copying Script to $bin ..."
cp termux-elf-cleaner $bin
echo -e $cyan" [ * ] Done !!"
echo -e $okegreen" [ * ] Fixing Termux Linker ..."
termux-elf-cleaner /data/data/com.termux/files/usr/lib/libcrypto.so
termux-elf-cleaner /data/data/com.termux/files/usr/lib/libssl.so
echo -e $cyan" [ * ] Done !!"
echo -e $okegreen" [ * ] Cleaning Junk ..."
cd ..
rm -rf termux-elf-cleaner
echo -e $cyan" [ * ] Done !!"
echo ""
echo -e $cyan" [ * ] ALL Done !!"
echo -e $white""
