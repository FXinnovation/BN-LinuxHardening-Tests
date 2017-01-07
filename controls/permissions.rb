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

control 'permissions-04' do
  title 'group file'
  desc "group file should be owned by root and only be readable to others."
  describe file('/etc/group') do
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

control 'permissions-05' do
  title 'shadow file'
  desc "shadow file should be owned by root and only be accessible to the owner"
  describe file('/etc/shadow') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should be_readable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('other') }
  end
end

control 'permissions-06' do
  title 'gshadow file'
  desc "shadow file should be owned by root and only be accessible to the owner"
  describe file('/etc/gshadow') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should be_readable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('other') }
  end
end

control 'permissions-07' do
  title 'World writeable files'
  desc "world writeable files should not exist on the system"
  describe command('df --local -P | awk {\'if (NR!=1) print $6\'} | xargs -I \'{}\' find \'{}\' -xdev -type f -perm -0002') do
    its('stdout') { should eq '' }
  end
end

control 'permissions-08' do
  title 'Legacy users passwd file'
  desc 'No Legacy "+" Entries Exist in /etc/passwd File'
  describe passwd do
    its('users') { should_not include /\+/ }
  end
end

control 'permissions-09' do
  title 'Legacy users shadow file'
  desc 'No Legacy "+" Entries Exist in /etc/shadow File'
  describe passwd('/etc/shadow') do
    its('users') { should_not include /\+/ }
  end
end

control 'permissions-10' do
  title 'Legacy groups in group file'
  desc 'No Legacy "+" Entries Exist in /etc/group File'
  describe etc_group do
    its('groups') { should_not include /\+/ }
  end
end

control 'permissions-11' do
  title 'UID 0'
  desc 'Make sure that only one user named root is UID 0'
  describe passwd.uids(0) do
    its('users') { should cmp 'root' }
    its('count') { should eq 1 }
  end
end

control 'permissions-12' do
  title 'GRUB configuration'
  desc "GRUB configuration should not be readable,writeable,executable by Group or Others."
  describe file('/boot/grub2/grub.cfg') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('other') }
  end
end

control 'permissions-13' do
  title 'Home Directories'
  desc 'Home directories should be owned by their users.'
  describe command("cat /etc/passwd | awk -F: '{ print $1 \" \" $3 \" \" $6 }' | while read user uid dir; do if [ $uid -ge 1000 -a -d \"$dir\" -a $user != \"nfsnobody\" ]; then owner=$(stat -L -c \"%U\" \"$dir\") ; if [ \"$owner\" != \"$user\" ]; then echo \"The home directory ($dir) of user $user is owned by $owner.\" ; fi ; fi ; done") do
    its('stdout') { should eq '' }
  end
end
