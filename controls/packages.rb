# encoding: utf-8
# author: Pascal S. Clermont

control 'package-01' do
  impact 1.0
  title 'Do not install telnet-server'
  describe package('telnet-server') do
    it { should_not be_installed }
  end
end

control 'package-02' do
  impact 1.0
  title 'Do not install telnet'
  describe package('telnet') do
    it { should_not be_installed }
  end
end

control 'package-03' do
  impact 1.0
  title 'Do not install rsh-server'
  describe package('rsh-server') do
    it { should_not be_installed }
  end
end

control 'package-04' do
  impact 1.0
  title 'Do not install rsh'
  describe package('rsh') do
    it { should_not be_installed }
  end
end

control 'package-05' do
  impact 1.0
  title 'Do not install rlogin'
  describe package('rlogin') do
    it { should_not be_installed }
  end
end

control 'package-06' do
  impact 1.0
  title 'Do not install NIS client'
  describe package('ypbind') do
    it { should_not be_installed }
  end
end

control 'package-07' do
  impact 1.0
  title 'Do not install NIS server'
  describe package('ypserv') do
    it { should_not be_installed }
  end
end

control 'package-08' do
  impact 1.0
  title 'Do not install tftp'
  describe package('tftp') do
    it { should_not be_installed }
  end
end

control 'package-09' do
  impact 1.0
  title 'Do not install tftp server'
  describe package('tftp-server') do
    it { should_not be_installed }
  end
end

control 'package-10' do
  impact 1.0
  title 'Do not install talk'
  describe package('talk') do
    it { should_not be_installed }
  end
end

control 'package-11' do
  impact 1.0
  title 'Do not install talk server'
  describe package('talk-server') do
    it { should_not be_installed }
  end
end

control 'package-12' do
  impact 1.0
  title 'Do not install xinetd'
  describe package('xinetd') do
    it { should_not be_installed }
  end
end

control 'package-13' do
  impact 1.0
  title 'Do not install dhcp server'
  describe package('dhcp') do
    it { should_not be_installed }
  end
end

control 'package-13' do
  impact 1.0
  title 'Do not install X window Manager'
  describe package('xorg-x11-server-common') do
    it { should_not be_installed }
  end
  describe file('/etc/systemd/system/default.target') do
    it { should be_linked_to '/usr/lib/systemd/system/multi-user.target' }
  end
end

control 'package-14' do
  impact 1.0
  title 'Do not install openldap server'
  describe package('openldap-servers') do
    it { should_not be_installed }
  end
end

control 'package-15' do
  impact 1.0
  title 'audit daemon should be installed'
  describe package('audit') do
    it { should be_installed }
  end
end

control 'package-16' do
  impact 1.0
  title 'samhain'
  desc 'samhain should be installed'
  describe package('samhain') do
    it { should be_installed }
  end
end
