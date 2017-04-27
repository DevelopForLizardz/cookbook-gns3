#
# Cookbook:: gns3
# Recipe:: hypervisors
#
# The MIT License (MIT)
#
# Copyright:: 2017, Ryan Drew
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Install KVM if set
if node['gns3']['hypervisors'].include?('kvm')
	if ['rhel', 'debian'].include?(node['platform_family'])
		package 'qemu-kvm' do
			action :install
		end
		
		if node['platform_family'] == 'rhel'
			package 'libvirt' do
				action :install
			end
		else
			package 'libvirt-bin' do
				action :install
			end
	elsif node['platform_family'] == 'arch'
		package 'qemu' do
			action :install
		end
		
		package 'libvirt' do
			action :install
		end
	else
		fail 'unsupported platform'
	end
end

# Instal Virtualbox if set
if node['gns3']['hypervisors'].include?('virtualbox')
	# Add VirtualBox repo for CentOS
	if node['platform_family'] == 'rhel'
		remote_file '/etc/yum.repos.d/virtualbox.repo' do
			source 'http://download.virtualbox.org/virtualbox/rmp/rhel/virtualbox.repo'
			owner 'root'
			group 'root'
			mode '0644'
			action :create
		end
	end
		
	# Install packages
	node['gns3']['packages']['virtualbox'].each do |pkg|
		package pkg do
			action :install
		end
	end
	
	# Setup for CentOS
	if node['platform_family'] == 'rhel'
		if node['platform_version'].split('.').first == '7'
			vboxdrv_path = '/usr/lib/virtualbox/vboxdrv.sh'
		else
			vboxdrv_path = '/etc/init.d/vboxdrv'
		end
		execute 'virtualbox setup' do
			command 'sh #{vboxdrv_path} setup'
		end

		# Add gns3 user to virtualbox group
		group 'vboxusers' do
			action :modify
			members '#{node[:gns3][:user]}'
			append true
		end
	end
		
end