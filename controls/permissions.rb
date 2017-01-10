# encoding: utf-8
# author: Pascal S. Clermont

control 'permissions-01' do
  title 'SSHD configuration'
  desc 'SSH Daemon configuration files should be owned by root and not modifiable by anyone else.'
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
  desc 'All system cron files should be owned by root and have proper permissions on them.'
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
  desc 'passwd file should be owned by root and only be readable to others.'
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
  desc 'group file should be owned by root and only be readable to others.'
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
  desc 'shadow file should be owned by root and only be accessible to the owner'
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
  desc 'shadow file should be owned by root and only be accessible to the owner'
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
  desc 'world writeable files should not exist on the system'
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
  desc 'GRUB configuration should not be readable,writeable,executable by Group or Others.'
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
  desc 'Home directories should be owned by their users. proper permissions should be set.'
  describe command("cat /etc/passwd | awk -F: '{ print $1 \" \" $3 \" \" $6 }' | while read user uid dir; do if [ $uid -ge 1000 -a -d \"$dir\" -a $user != \"nfsnobody\" ]; then owner=$(stat -L -c \"%U\" \"$dir\") ; if [ \"$owner\" != \"$user\" ]; then echo \"The home directory ($dir) of user $user is owned by $owner.\" ; fi ; fi ; done") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
  describe command("cat /etc/passwd | awk -F: '{ if ( $3 > 999 && $7 != \"/sbin/nologin\" ) { print $6 } }' | while read dir; do dirperm=$(/bin/ls -ld $dir | /bin/cut -f1 -d\" \") ; if [ $(echo $dirperm | /bin/cut -c6) != \"-\" ]; then echo \"Group Write permission set on directory $dir\" ; fi ; if [ $(echo $dirperm | /bin/cut -c8) != \"-\" ]; then echo \"Other Read permission set on directory $dir\" ; fi ; if [ $(echo $dirperm | /bin/cut -c9) != \"-\" ]; then echo \"Other Write permission set on directory $dir\" ; fi ; if [ $(echo $dirperm | /bin/cut -c10) != \"-\" ]; then echo \"Other Execute permission set on directory $dir\" ; fi ;done") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end

control 'permissions-14' do
  title 'User Dot Files'
  desc 'Check User Dot File Permissions'
  describe command("cat /etc/passwd | awk -F: '{ if ( $3 > 999 && $7 != \"/sbin/nologin\" ) { print $6 } }' | while read dir; do sudo ls -la1 $dir | grep -v ^total | awk -F' ' '{  if ( $9 !~ /\\.$/ ) { print $1 \" \" $9 } }'| while read fileperm file; do if [ ! -h \"$file\" -a -f \"$file\" ]; then if [ $(echo $fileperm | /bin/cut -c6) != \"-\" ]; then echo \"Group Write permission set on file $dir/$file\"; fi ; if [ $(echo $fileperm | /bin/cut -c9) != \"-\" ]; then echo \"Other Write permission set on file $dir/$file\" ; fi; fi; done; done") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end

control 'permissions-15' do
  title 'User netrc Files'
  desc 'Check User netrc File Permissions'
  describe command("cat /etc/passwd | awk -F: '{ if ( $3 > 999 && $7 != \"/sbin/nologin\" ) { print $6 } }' | while read dir; do sudo ls -la1 $dir/.netrc 2> /dev/null | grep -v ^total | awk -F' ' '{ print $1 \" \" $9 }'| while read fileperm file; do if [ $(echo $fileperm | /bin/cut -c5) != \"-\" ] ; then echo \"Group Read set on $dir/$file\"; fi; if [ $(echo $fileperm | /bin/cut -c6) != \"-\" ] ; then echo \"Group Write set on $dir/$file\"; fi; if [ $(echo $fileperm | /bin/cut -c7) != \"-\" ]; then echo \"Group Execute set on $dir/$file\"; fi; if [ $(echo $fileperm | /bin/cut -c8) != \"-\" ]; then echo \"Other Read set on $dir/$file\"; fi; if [ $(echo $fileperm | /bin/cut -c9) != \"-\" ]; then echo \"Other Write set on $dir/$file\"; fi; if [ $(echo $fileperm | /bin/cut -c10) != \"-\" ]; then echo \"Other Execute set on $dir/$file\"; fi; done; done") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end

control 'permissions-16' do
  title 'Un-Owned Files'
  desc 'find files that are not owned by anyone or group.'
  describe command("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' sudo find '{}' -xdev -nouser -ls") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
  describe command("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' sudo find '{}' -xdev -nogroup -ls") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end

control 'permissions-17' do
  title 'User rhosts Files'
  desc 'Check for Presence of User .rhosts Files'
  describe command("cat /etc/passwd | awk -F: '{ if ( $3 > 999 && $7 != \"/sbin/nologin\" ) { print $6 } }' | while read dir; do sudo ls -la1 $dir/.rhosts 2> /dev/null | grep -v ^total | awk -F' ' '{ print $9 }'| while read file; do echo \".rhosts file in $dir\"; done; done") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end

control 'permissions-18' do
  title 'Home Directories'
  desc 'Check That Users Are Assigned Valid Home Directories'
  describe command("cat /etc/passwd | awk -F: '{ print $1 \" \" $3 \" \" $6 }' | while read user uid dir; do if [ $uid -ge 1000 -a ! -d \"$dir\" -a $user != \"nfsnobody\" ]; then echo \"The home directory ($dir) of user $user does not exist.\"; fi; done") do
    its('stdout') { should eq '' }
    its('stderr') { should eq '' }
  end
end
