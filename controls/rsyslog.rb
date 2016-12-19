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
