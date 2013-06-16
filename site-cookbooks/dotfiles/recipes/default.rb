#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git node["user"]["home"] + "/.dotfiles" do
  user node["user"]["name"]
  group node["user"]["group"]
  repository node["user"]["dotfiles_repo"]
  reference "master"
  action :checkout
end

bash "install dotfiles" do
  user node["user"]["name"]
  group node["user"]["group"]
  cwd node["user"]["home"]
  environment "HOME" => node["user"]["home"]
  code <<-EOC
    $HOME/.dotfiles/install.sh
  EOC
  creates node["user"]["home"] + "/.dotfiles/.executed"
end

