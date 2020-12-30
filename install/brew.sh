#!/bin/sh

# shellcheck disable=SC2230
which -s brew
# shellcheck disable=SC2039
if [[ $? != 0 ]] ; then
    echo "Installing homebrew"
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
else
    echo "Brew already installed"
fi