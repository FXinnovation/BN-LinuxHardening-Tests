# encoding: utf-8
# author: Pascal S. Clermont

control 'yum-01' do
  title 'GPG check enabled'
  desc "gpgcheck parameter should be set to 1 in /etc/yum.conf"
  describe file('/etc/yum.conf') do
    its('content') { should match(%r{gpgcheck=1}) }
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
  end
end

