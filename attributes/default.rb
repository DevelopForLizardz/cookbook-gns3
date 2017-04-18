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

node['gns3']['gns3_user'] = 'gns3'
node['gns3']['data_dir'] = '/home/#{node[:gns3][:gns3_user]}/GNS3'
node['gsn3']['config_dir'] = '/home/#{node[:gns3][:gns3_user]}/.config/GNS3'
node['gns3']['projects_dir'] = '#{node[:gns3][:data_dir]}/projects'
node['gns3']['images_dir'] = '#{node[:gns3][:data_dir]}/images'
node['gns3']['iou'] = true
node['gns3']['virtualbox'] = false
node['gns3']['qemu'] = true
node['gns3']['vmware'] = false
