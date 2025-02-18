#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync \
		--exclude ".DS_Store" \
		--exclude ".git/" \
		--exclude ".gitmodules" \
		--exclude ".osx" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "README.md" \
		--exclude "bootstrap.sh" \
		--exclude "brew-backup" \
		--exclude "diff-existing.sh" \
		--exclude "init" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

mkdir -p ~/.vim/backups
