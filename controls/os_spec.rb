# encoding: utf-8
# author: Pascal S. Clermont

control 'os-01' do
  title 'Daemon UMASK'
  desc "daemon's umask should be set to 027"
  describe file('/etc/sysconfig/init') do
    its('content') { should match %r{.*\numask\s+027[^0-9].*} }
  end
end

