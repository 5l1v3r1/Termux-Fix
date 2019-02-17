#!/bin/sh

blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

echo -e "$cyan [$okegreen *$cyan ]$white Updating Termux ..."
pkg update
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e "$cyan [$okegreen *$cyan ]$white Installing Dependencies ..."
echo -e "$cyan [$okegreen *$cyan ]$white Installing Make ..."
pkg install make -y
echo -e "$cyan [$okegreen *$cyan ]$white Installing Clang ..."
pkg install clang -y
echo -e "$cyan [$okegreen *$cyan ]$white Installing Git ..."
pkg install git -y
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e "$cyan [$okegreen *$cyan ]$white Getting termux-elf-cleaner Script ..."
git clone https://github.com/Harshiv-Patel/termux-elf-cleaner.git
cd termux-elf-cleaner
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e "$cyan [$okegreen *$cyan ]$white Building Script ..."
make
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e "$cyan [$okegreen *$cyan ]$white Copying Script to $PREFIX/bin/ ..."
cp termux-elf-cleaner $PREFIX/bin/
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e "$cyan [$okegreen *$cyan ]$white Fixing Termux Linker ..."
termux-elf-cleaner /data/data/com.termux/files/usr/lib/libcrypto.so
termux-elf-cleaner /data/data/com.termux/files/usr/lib/libssl.so
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e "$cyan [$okegreen *$cyan ]$white Cleaning Junk ..."
cd ..
rm -rf termux-elf-cleaner
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo ""
echo -e "$cyan [$okegreen *$cyan ]$okegreen Done !!"
echo -e $white""
