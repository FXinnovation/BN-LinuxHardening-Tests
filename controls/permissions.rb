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

control 'permissions-02' do
  title 'Cron configuration files'
  desc "All system cron files should be owned by root and have proper permissions on them."
  describe file('/etc/anacrontab') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
  describe file('/etc/crontab') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
  describe file('/etc/cron.hourly') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
  describe file('/etc/cron.daily') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
  describe file('/etc/cron.weekly') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
  describe file('/etc/cron.monthly') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
  describe file('/etc/cron.d') do
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_executable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
    it { should_not be_readable.by('other') }
  end
end

control 'permissions-03' do
  title 'passwd file'
  desc "passwd file should be owned by root and only be readable to others."
  describe file('/etc/passwd') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should be_readable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should be_readable.by('group') }
    it { should_not be_writable.by('other') }
    it { should be_readable.by('other') }
  end
end

