#
# Cookbook Name:: laravel
# Recipe:: default
#
# Copyright 2013, Mathias Hansen
#
# All rights reserved - Do Not Redistribute
#

# Disable default vhost config
execute "disable-default-site" do
  command "a2dissite default"
end

# Enable laravel vhost
web_app "laravel" do
  server_name node['hostname']
  application_name "laravel-app"
  docroot "/vagrant/laravel/public"
  log_dir node['apache']['log_dir'] 
end

# Make sure laravel storage directory is writeable
directory "/vagrant/laravel/app/storage" do
  mode 00755
  action :create
end

# Install PHP5 modules
package "php5-mysql" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-mcrypt" do
  action :install
end

package "php5-memcached" do
  action :install
end