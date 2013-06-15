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

execute "killall Dock" do
  ignore_failure true
  action :nothing
end

