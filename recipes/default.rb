#
# Cookbook Name:: chef-recipes-centos6-japanese-support
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# language support
bash 'set timezone' do
	user "root"
	code <<-EOS
		yum -y groupinstall japanese-support
		mv /etc/localtime /etc/localtime.org; ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
		localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
	EOS
end

template "/etc/sysconfig/i18n" do
  mode '0644'
  owner 'root'
  group 'root'
end