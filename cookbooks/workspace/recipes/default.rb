#
# Cookbook Name:: workspace
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package %w{git lua5.1 liblua5.1-dev luajit libluajit-5.1-dev cscope}

git '/tmp/vim' do
  repository 'https://github.com/vim/vim.git'
  revision 'master'
  user 'vagrant'
  group 'vagrant'
  action :checkout
end

directory '/home/vagrant/local' do
  user 'vagrant'
  group 'vagrant'
end

execute 'build' do
  user 'vagrant'
  cwd '/tmp/vim'
  command <<EOC
./configure --prefix=/home/vagrant/local --with-features=huge --enable-pythoninterp=yes --enable-luainterp=yes --with-luajit --enable-cscope
make
make install
EOC
end

include_recipe 'workspace::zsh'
include_recipe 'workspace::go'
