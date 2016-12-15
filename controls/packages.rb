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
  title 'Do not install talk'
  describe package('talk') do
    it { should_not be_installed }
  end
end
