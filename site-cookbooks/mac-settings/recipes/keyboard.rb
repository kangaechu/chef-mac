# The following won't take effect until the person logs out & logs back in again.
mac_os_x_userdefaults "Turn on function-keys-work-as-function keys" do
  domain '.GlobalPreferences'
  key 'com.apple.keyboard.fnState'
  value "true"
  type "boolean"
  user node["user"]["name"]
end
