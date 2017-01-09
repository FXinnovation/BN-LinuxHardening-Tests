# encoding: utf-8
# author: Pascal S. Clermont

control 'rsyslog-01' do
  impact 1.0
  title 'rsyslog installed'
  describe package('rsyslog') do
    it { should be_installed }
  end
end

control 'rsyslog-02' do
  impact 1.0
  title 'rsyslog service'
  describe systemd_service('rsyslog') do
    it { should be_running }
  end
end

control 'rsyslog-03' do
  impact 1.0
  title 'syslog service'
  describe systemd_service('syslog') do
    it { should_not be_running }
  end
end

control 'rsyslog-04' do
  impact 1.0
  title 'rsyslog Configuration'
  describe file('/etc/rsyslog.conf') do
    its('content') { should match(%r{\$FileOwner\ssyslog}) }
    its('content') { should match(%r{\$FileGroup\ssyslog}) }
    its('content') { should match(%r{\$FileCreateMode\s0640}) }
    its('content') { should match(%r{\$DirCreateMode\s0750}) }
    its('content') { should match(%r{\$Umask\s0027}) }
    its('content') { should match(%r{\$PrivDropToUser\ssyslog}) }
    its('content') { should match(%r{\$PrivDropToGroup\ssyslog}) }
    its('content') { should match(%r{auth\,authpriv\,user\.\*\s\/var\/log\/secure}) }
    its('content') { should match(%r{kern\.\*\s\/var\/log\/kern.log}) }
    its('content') { should match(%r{daemon\.\*\s\/var\/log\/daemon.log}) }
    its('content') { should match(%r{syslog\.\*\s\/var\/log\/syslog}) }
    its('content') { should match(%r{lpr\,news\,uucp\,local0\,local1\,local2\,local3\,local4\,local5\,local6\.\*\s\/var\/log\/unused.log}) }
    its('content') { should match(%r{local2\.\*\s+\/var\/log\/local2_samhain.log}) }
  end
end
