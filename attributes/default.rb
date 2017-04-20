#
# Cookbook:: gns3
# Attributes:: default
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

# Select vm providers to install
node['gns3']['vm_providers'] = %w(virtualbox, vmware, qemu, docker, iou)

# Packages
node['gns3']['packages'] = {
	'server' => %w(gns3_server),
	'client' => %w(gns3_gui)
}

# Paths
node['gns3']['paths'] = {
	'gns3_dir' => '/home/gns3/GNS3',
	'projects_dir' => '#{node[:gns3][:paths][:gns3_dir]}/projects',
	'images_dir' => '#{node[:gns3][:paths][:gns3_dir]}/images',
	'config_dir' => '/home/gns3/.config/GNS3',
	'server_config' => 'FILE:#{node[:gns3][:paths][:config_dir]}/gns3_server.conf',
	'vpcs' => '/usr/local/bin/vpcs',
	'dynamips' => '/usr/local/bin/dynamips',
	'iouyap' => '/usr/local/bin/iouyap',
	'iourc' => '/home/gns3/.iourc',
	'vboxmanage' => '/usr/local/bin/VBoxManage',
	'vmrun' => '/usr/bin/local/vmrun',
	'project_source' => '/home/GNS3/Documents/project.gns3project'
}

# Server configuration
node['gns3']['server'] = {
	'host' => '127.0.0.1',
	'port' => '3080',
	'report_errors' => true,
	'console_start_port_range' => '2001',
	'console_end_port_range' => '5000',
	'udp_start_port_range' => '10000',
	'udp_start_end_range' => '20000',
	'ubridge_path' => '',
	'auth' => true,
	'user' => 'bob',
	'password' => 'alice',
	'as_service' => true
}

# Dynamips configuration
node['gns3']['dynamips'] = {
	'allocate_aux_console_ports' => false,
	'mmap_support' => true,
	'sparse_memory_support' => true,
	'ghost_ios_support' => 'true',
}

# IOU configuration
node['gns3']['iou']['license_check'] = true

# Virtualbox configuration
node['gns3']['virtualbox']['vbox_user'] = ''

# VMware configuration
node['gns3']['vmware'] = {
	'host_type' => 'fusion',
	'vmnet_start_range' => 2,
	'vmnet_end_range' => 50
}

# QEMU configuration
node['gns3']['qemu']['enable_kvm'] = true

