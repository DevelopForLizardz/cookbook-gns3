#
# Cookbook:: gns3
# Attributes:: server
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

# http://docs.gns3.com/1f6uXq05vukccKdMCHhdki5MXFhV8vcwuGwiRvXMQvM0/

node['gns3']['server']['version'] = '1.5.4'
node['gns3']['server']['config_path'] = 'FILE:#{node[:gns3][:config_dir]}/gns3_server.conf'
node['gns3']['server']['config'] = {
	'host' => '127.0.0.1',
	'port' => '3080',
	'images_path' => '#{node[:gns3][:images_dir]}',
	'projects_path' => '#{node[:gns3][:projects_dir]}',
	'report_erros' => true,
	'console_start_port_range' => 2001,
	'console_end_port_range' => 5000,
	'udp_start_port_range' => 10000,
	'udp_end_port_range' => 20000,
	'ubridge_path' => '',
	'auth' => true,
	'user' => 'bob',
	'password' => 'alice'
}
node['gns3']['server']['vpcs']  ={
	'vpcs_path' => 'FILE:/usr/local/bin/vpcs'
}