DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

osx: brew osx-brew osx-brew-cask mas

brew:
	$(DOTFILES_DIR)/install/brew.sh

osx-brew: brew
	- @echo "Install brew packages"
	- brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

osx-brew-cask: brew
	- @echo "Install brew cask packages"
	- brew bundle --file=$(DOTFILES_DIR)/install/Caskfile || true

mas:
	mas install 441258766  # Magnet
	mas install 1475387142 # Tailscale

upgrade:
	- @echo "Going to upgrade all packages"
	- brew update
	- brew upgrade
	- brew autoremove

apps-config:
	- @echo "Install git"
	- cp -r $(DOTFILES_DIR)/apps/git/.gitconfig ~/.gitconfig
	- cp -r $(DOTFILES_DIR)/apps/git/.gitignore ~/.gitignore
	- @echo "Install terraform"
	- cp -r $(DOTFILES_DIR)/apps/terraform/.terraformrc ~/.terraformrc
	- mkdir -p ~/.terraform.d/plugin-cache

