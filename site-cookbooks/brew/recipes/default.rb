#
# Cookbook Name:: brew
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["brew"]["packages"].each do |pkg|
  package pkg
end
