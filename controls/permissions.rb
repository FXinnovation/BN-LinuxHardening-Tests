# encoding: utf-8
# author: Pascal S. Clermont

control 'permissions-01' do
  title 'SSHD configuration'
  desc "SSH Daemon configuration files should be owned by root and not modifiable by anyone else."
  describe file('/etc/ssh/sshd_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

