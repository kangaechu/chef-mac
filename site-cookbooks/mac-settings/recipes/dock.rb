mac_os_x_userdefaults "dock autohide" do
  domain "com.apple.dock"
  key "autohide"
  value node["dock"]["autohide"]
  type "boolean"
  user node["user"]["name"]
  notifies :run, 'execute[killall Dock]'
end

execute "killall Dock" do
  ignore_failure true
  action :nothing
end

