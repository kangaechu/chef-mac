home = node["user"]["home"]

directory home + "/.vim" do
  owner node["user"]["name"]
  group node["user"]["group"]
  action :create
end

directory home + "/.vim/bundle" do
  owner node["user"]["name"]
  group node["user"]["group"]
  action :create
end

# install vundle
git home + "/.vim/bundle/vundle" do
  user node["user"]["name"]
  group node["user"]["group"]
  repository "https://github.com/gmarik/vundle.git"
  reference "master"
  action :checkout
end

