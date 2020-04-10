#!/usr/bin/bash

# Install `rbenv` to manage all Ruby versions
# REF: https://github.com/rbenv/rbenv
printf "Installing rbenv..."
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
mkdir -p "$(rbenv root)"/plugins

# Install `ruby-build` so we can install arbitrary Ruby releases
# REF: https://github.com/rbenv/ruby-build
printf "Installing ruby-build..."
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install the latest core Ruby release
printf "Installing latest stable release of Ruby..."
release="$(rbenv install --list | grep "^[0-9]" | grep -v "[a-z]" | tail -n 1)"
rbenv install $release

printf "Done!"
