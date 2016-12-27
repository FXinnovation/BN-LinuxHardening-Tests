# encoding: utf-8
# author: Pascal S. Clermont

control 'os-01' do
  title 'Daemon UMASK'
  desc "daemon's umask should be set to 027"
  describe file('/etc/sysconfig/init') do
    its('content') { should match %r{.*\numask\s+027[^0-9].*} }
  end
end

control 'os-02' do
  title 'user UMASK'
  desc "verify default umask for users to 077"
  describe file('/etc/profile.d/umask.sh') do
    its('content') { should match %r{umask\s+077} }
  end
  describe file('/etc/bashrc') do
    its('content') { should match %r{.*\n\s*umask\s+077[^0-9].*} }
  end
end

control 'os-03' do
  title 'Login Banner'
  desc "verify login banner does not contain sensitive information."
  describe file('/etc/motd') do
    its('content') { should_not match %r{.*\\[mrsv].*} }
  end
  describe file('/etc/issue') do
    its('content') { should_not match %r{.*\\[mrsv].*} }
  end
  describe file('/etc/issue.net') do
    its('content') { should_not match %r{.*\\[mrsv].*} }
  end
end

