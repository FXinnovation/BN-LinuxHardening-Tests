# encoding: utf-8
# author: Pascal S. Clermont

control 'limits-01' do
  title 'GPG check enabled'
  desc "gpgcheck parameter should be set to 1 in /etc/yum.conf"
  describe limits_conf() do
     its('*') { should include ['hard', 'core', '0'] }
  end
end

