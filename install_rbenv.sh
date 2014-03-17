#!/bin/sh

ruby_version=2.0.0-p451

# Install Libraries for build
yum -y update
yum -y install man
yum -y install \
	gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel \
	libffi-devel openssl-devel make bzip2 autoconf automake libtool bison wget unzip git 

# Install Ruby
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
mkdir /usr/local/rbenv/{shims,versions}
groupadd rbenv
chgrp -R rbenv rbenv
chmod -R g+rwxXs rbenv

git clone https://github.com/sstephenson/ruby-build.git /usr/local/ruby-build
cd /usr/local/ruby-build
./install.sh

cat >> /usr/local/rbenv/bashrc <<'EOF'
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
EOF

cat >> /root/.bashrc <<'EOF'

. /usr/local/rbenv/bashrc
EOF

. /usr/local/rbenv/bashrc

rbenv install $ruby_version
rbenv rehash
rbenv global $ruby_version
rbenv shell $ruby_version
