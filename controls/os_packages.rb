# encoding: utf-8
# author: Pascal S. Clermont

control 'package-01' do
  impact 1.0
  title 'Do not install telnet'
  describe package('telnet-server') do
    it { should_not be_installed }
  end
end
