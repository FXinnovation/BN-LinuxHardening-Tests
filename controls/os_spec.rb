# encoding: utf-8
# author: Pascal S. Clermont

control 'os-01' do
  title 'Daemon UMASK'
  desc 'daemon umask should be set to 027'
  describe file('/etc/sysconfig/init') do
    its('content') { should match(%r{.*\numask\s+027[^0-9].*}) }
  end
end

control 'os-02' do
  title 'user UMASK'
  desc 'verify default umask for users to 077'
  describe file('/etc/profile.d/umask.sh') do
    its('content') { should match(%r{umask\s+077}) }
  end
  describe file('/etc/bashrc') do
    its('content') { should match(%r{.*\n\s*umask\s+077[^0-9].*}) }
  end
end

control 'os-03' do
  title 'Login Banner'
  desc 'verify login banner does not contain sensitive information.'
  describe file('/etc/motd') do
    its('content') { should_not match(%r{.*\\[mrsv].*}) }
  end
  describe file('/etc/issue') do
    its('content') { should_not match(%r{.*\\[mrsv].*}) }
  end
  describe file('/etc/issue.net') do
    its('content') { should_not match(%r{.*\\[mrsv].*}) }
  end
end

control 'os-04' do
  title 'Password Duration'
  desc 'Password should be valid for atleast 1 day'
  describe login_defs do
    its('PASS_MIN_DAYS') { should eq '1' }
    its('PASS_MAX_DAYS') { should eq '90' }
  end
end

control 'os-05' do
  title 'SU reserved to wheel group'
  desc 'only a memeber of the wheel group should be able to use SU.'
  describe file('/etc/pam.d/su') do
    its('content') { should match(%r{.*\nauth\s+required\s+pam_wheel.so\s+use_uid\s*\n.*}) }
  end
end

control 'os-06' do
  title 'Limit password reuse'
  desc 'Password should not be reused to 4'
  describe file('/etc/pam.d/system-auth') do
    its('content') { should match(%r{.*\npassword\s+sufficient\s+pam_unix.so.*remember=4.*\n.*}) }
  end
end

control 'os-07' do
  title 'Password Compliant'
  desc 'Define pam_pwquality to be compliant with the bank requirement'
  describe file('/etc/pam.d/passwd') do
    its('content') { should match(%r{.*\npassword\s+required\s+pam_pwquality.so\s+try_first_pass\s+retry=5.*}) }
  end
  describe parse_config_file('/etc/security/pwquality.conf') do
    its('minlen') { should eq '8' }
    its('dcredit') { should eq '1' }
    its('ucredit') { should eq '1' }
    its('ocredit') { should eq '1' }
    its('lcredit') { should eq '1' }
    its('minclass') { should eq '4' }
  end
end

control 'os-08' do
  title 'Password Algorithm'
  desc 'password algorithm should be sha512'
  describe command('authconfig --test') do
    its('stdout') { should match(%r{.*password\shashing\salgorithm\sis\ssha512.*}) }
  end
end


control 'os-09' do
  impact 1.0
  title 'Dot in PATH variable'
  desc 'Do not include the current working directory in PATH variable. This makes it easier for an attacker to gain extensive rigths by executing a Trojan program'
  describe os_env('PATH') do
    its('split') { should_not include('') }
    its('split') { should_not include('.') }
  end
end

control 'os-10' do
  title 'find SUID executables'
  # SUID executables part of a clean install
  whitelist = ['/usr/bin/chage',
               '/usr/bin/chfn',
               '/usr/bin/chsh',
               '/usr/bin/gpasswd',
               '/usr/bin/newgrp',
               '/usr/bin/mount',
               '/usr/bin/pkexec',
               '/usr/bin/crontab',
               '/usr/bin/su',
               '/usr/bin/umount',
               '/usr/bin/sudo',
               '/usr/bin/passwd',
               '/usr/bin/staprun',
               '/usr/sbin/pam_timestamp_check',
               '/usr/sbin/unix_chkpwd',
               '/usr/sbin/usernetctl',
               '/usr/sbin/mount.nfs',
               '/usr/lib/polkit-1/polkit-agent-helper-1',
               '/usr/lib64/dbus-1/dbus-daemon-launch-helper']
  output = command("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' sudo find '{}' -xdev -type f -perm -4000 -print")

  diff = output.stdout.split(/\r?\n/) - whitelist

  describe diff do
    it { should be_empty }
  end
end

control 'os-11' do
  title 'find SGID executables'
  whitelist = ['/usr/bin/wall',
               '/usr/bin/write',
               '/usr/bin/ssh-agent',
               '/usr/sbin/netreport',
               '/usr/sbin/postdrop',
               '/usr/sbin/postqueue',
               '/usr/libexec/utempter/utempter',
               '/usr/libexec/openssh/ssh-keysign']
  output = command("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000 -print")
  diff = output.stdout.split(/\r?\n/) - whitelist

  describe diff do
    it { should be_empty }
  end
end

control 'os-12' do
  title 'root crontab'
  only_if do
    file('/var/spool/cron/root').exist?
  end
  describe file('/var/spool/cron/root') do
    it { should be_owned_by 'root' }
  end
end

control 'os-13' do
  title 'Interactive startup'
  desc 'interactive startup should be disabled'
  only_if do
    parse_config_file('/etc/sysconfig/init').params('PROMPT') != nil
  end
  describe parse_config_file('/etc/sysconfig/init') do
    its('PROMPT') { should eq 'no' }
  end
end

control 'os-14' do
  title 'Single User'
  desc 'Single user should be password protected'
  describe parse_config_file('/etc/sysconfig/init') do
    its('SINGLE') { should eq 'sulogin' }
  end
end