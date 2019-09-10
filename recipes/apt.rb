# https://docs.chef.io/resource_apt_update.html
apt_update


apt_package 'default-jdk' do
  action :upgrade
end
