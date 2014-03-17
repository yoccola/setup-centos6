#!/bin/bash

# Install Libraries for build
yum -y update
yum -y install man
yum -y install \
	gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel \
	libffi-devel openssl-devel make bzip2 autoconf automake libtool bison wget unzip git 
