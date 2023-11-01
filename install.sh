#!/usr/bin/env bash
#this is not needed

cd "$(dirname "${BASH_SOURCE[0]}")";

git pull origin master;

function deployDotfiles() {
	rsync --exclude=".git/" \
    --exclude="README.md" \
		--exclude="install.sh" \
		-acvzh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	deployDotfiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		deployDotfiles;
	fi;
fi;
source ~/.bash_profile;
unset deployDotfiles;
