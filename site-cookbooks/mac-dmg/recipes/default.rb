#
# Cookbook Name:: mac-dmg
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

dmg_package "Google Chrome" do
  dmg_name "googlechrome"
  source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
  action :install
end

# Last Pass
dmg_package "lpmacosx" do
  volumes_dir "LastPass for Mac OS X"
  dmg_name "lastpass"
  source "https://lastpass.com/download/cdn/lpmacosx.dmg"
  type "pkg"
  package_id "com.lastpass.lpmacosx"
  action :install
end

dmg_package "GoogleJapaneseInput" do
  source "https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg"
  type "pkg"
  package_id "com.google.pkg.GoogleJapaneseInput"
  action :install
end

dmg_package "KeyRemap4MacBook" do
  volumes_dir "KeyRemap4MacBook-8.3.0"
  source "https://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-8.3.0.dmg"
  type "pkg"
  package_id "org.pqrs.driver.KeyRemap4MacBook"
  action :install
end

# KeyRemap4MacBook Setting
directory node["user"]["home"] + "/Library/Application Support/KeyRemap4MacBook" do
  owner node["user"]["name"]
  group node["user"]["group"]
  action :create
end

cookbook_file node["user"]["home"] + "/Library/Application Support/KeyRemap4MacBook/private.xml" do
  source "private.xml"
  owner node["user"]["name"]
  group node["user"]["group"]
  mode 0644
end

