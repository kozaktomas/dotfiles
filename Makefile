DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

osx: brew osx-brew osx-brew-cask

brew:
	$(DOTFILES_DIR)/install/brew.sh

osx-brew: brew
	- @echo "Install brew packages"
	- brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

osx-brew-cask: brew
	- @echo "Install brew cask packages"
	- brew bundle --file=$(DOTFILES_DIR)/install/Caskfile || true