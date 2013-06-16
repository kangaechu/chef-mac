# The following won't take effect until the person logs out & logs back in again.
mac_os_x_userdefaults "function-keys-work-as-function keys" do
  domain '.GlobalPreferences'
  key 'com.apple.keyboard.fnState'
  value node["keyboard"]["fnkey"]
  type "boolean"
  user node["user"]["name"]
end
