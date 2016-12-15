# encoding: utf-8
# author: Pascal S. Clermont

control 'service-01' do
  impact 1.0
  title 'Character Generator Protocol (CHARGEN) DGRAM services'
  describe systemd_service('chargen-dgram') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end
