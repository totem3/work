#
# Cookbook Name:: workspace
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package %w{git}
node.normal['tz'] = 'Asia/Tokyo'
include_recipe 'timezone-ii'

include_recipe 'workspace::ruby'
include_recipe 'workspace::zsh'
include_recipe 'workspace::vim'
include_recipe 'workspace::go'
