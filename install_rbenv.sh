#!/bin/bash

ruby_version=2.1.1

# Install Ruby
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
mkdir /usr/local/rbenv/{shims,versions}
groupadd rbenv
chgrp -R rbenv /usr/local/rbenv
chmod -R g+rwxXs /usr/local/rbenv

git clone https://github.com/sstephenson/ruby-build.git /usr/local/ruby-build
cd /usr/local/ruby-build
./install.sh

if [ ! $(grep RBENV_ROOT /usr/local/rbenv/bashrc) ]; then
cat <<'EOF' >>/usr/local/rbenv/bashrc
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
EOF
fi


if [ ! $(grep rbenv /root/.bashrc) ]; then
cat <<'EOF' >>/root/.bashrc
. /usr/local/rbenv/bashrc
EOF
fi

. /root/.bashrc

rbenv install $ruby_version
rbenv rehash
rbenv global $ruby_version
rbenv shell $ruby_version

