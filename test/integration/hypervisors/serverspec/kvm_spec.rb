# test/shared/spec_helper.rb is moved to /tmp/kitchen/data/spec_helper.rb
require 'serverspec'

set :backend, :exec

describe 'KVM Installed' do
	describe package('qemu-kvm') do
		it { should be_installed }
	end

	describe package('libvirt-bin'), :if => ['debian', 'ubuntu'].include?(os[:family]) do
		it { should be_installed }
	end

	describe package('libvirt'), :if => os[:family] == 'redhat' do
		it { should be_installed }
	end

end
