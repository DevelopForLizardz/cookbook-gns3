require 'serverspec'

set :backend, :exec

describe 'KVM Installed' do
    # check for qemu/kvm
    if ['debian', 'ubuntu', 'redhat'].include?(os[:family])
        describe package('qemu-kvm')
            it { should be_installed }
        end
    elsif os[:family] == 'arch'
        describe package ('qemu')
            it { should be_installed }
    else
        fail 'unsupported platform'

    # check for libvirt
    if ['debian', 'ubuntu'].include?(os[:family])
        describe package('libvirt-bin')
            it { should be_installed }
        end
    elsif ['redhat', 'arch'].include?(os[:family])
        describe package('libvirt')
            it { should be_installed }
        end
    else
        fail 'unsupported platform'
    end
end


