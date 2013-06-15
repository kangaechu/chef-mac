%w{ autohide }.each do |dock|
  mac_os_x_userdefaults "com.apple.dock #{dock}" do
    domain "com.apple.dock"
    key dock
    value "true"
    type "boolean"
    user node["user"]["name"]
    notifies :run, 'execute[killall Dock]'
  end
end

#mac_os_x_userdefaults "com.apple.dock tile size" do
  #domain "com.apple.dock"
  #key "tilesize"
  #value "20"
  #type "integer"
  #notifies :run, 'execute[killall Dock]'
#end

execute "killall Dock" do
  ignore_failure true
  action :nothing
end

