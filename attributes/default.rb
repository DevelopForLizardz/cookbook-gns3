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

# Paths
node['gns3']['paths'] = {
	'gns3_dir' => '/home/gns3/GNS3',
	'projects_dir' => '#{node[:gns3][:paths][:gns3_dir]}/projects',
	'images_dir' => '#{node[:gns3][:paths][:gns3_dir]}/images',
	'config_dir' => '/home/gns3/.config/GNS3',
	'server_config' => 'FILE:#{node[:gns3][:paths][:config_dir]}/gns3_server.conf'
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
	'password' => 'alice'
}
node['gns3']['gns3_user'] = 'gns3'
node['gns3']['data_dir'] = '/home/#{node[:gns3][:gns3_user]}/GNS3'
node['gsn3']['config_dir'] = '/home/#{node[:gns3][:gns3_user]}/.config/GNS3'
node['gns3']['projects_dir'] = '#{node[:gns3][:data_dir]}/projects'
node['gns3']['images_dir'] = '#{node[:gns3][:data_dir]}/images'
node['gns3']['iou'] = true
node['gns3']['virtualbox'] = false
node['gns3']['qemu'] = true
node['gns3']['vmware'] = false
