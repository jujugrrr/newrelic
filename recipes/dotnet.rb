#
# Cookbook Name:: newrelic
# Recipe:: dotnet
#
# Copyright 2012-2013, Escape Studios
#

include_recipe "ms_dotnet4"

windows_package "Install New Relic .NET Agent" do
	source node['newrelic']['dotnet']['https_download']
	options "/qb NR_LICENSE_KEY=#{node['newrelic']['application_monitoring']['license']} INSTALLLEVEL=#{node['newrelic']['dotnet']['install_level']}"
	installer_type :msi
	action :install
	not_if{File.exists?("C:\\Program Files\\New Relic\\.NET Agent")}
end
