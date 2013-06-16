#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

home = node["user"]["home"]

git home + "/.dotfiles" do
  user node["user"]["name"]
  group node["user"]["group"]
  repository node["user"]["dotfiles_repo"]
  reference "master"
  action :checkout
end

bash "install dotfiles" do
  user node["user"]["name"]
  group node["user"]["group"]
  cwd home
  environment "HOME" => home
  code <<-EOC
    $HOME/.dotfiles/install.sh
  EOC
  creates home + "/.dotfiles/.executed"
end

template home + "/.dotfiles/dot.zsh/.zshrc.local" do
  source "dot.zshrc.local.erb"
  owner node["user"]["name"]
  group node["user"]["group"]
  mode 0644
end
