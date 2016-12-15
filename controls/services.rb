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

control 'service-02' do
  impact 1.0
  title 'Character Generator Protocol (CHARGEN) STREAM services'
  describe systemd_service('chargen-stream') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-03' do
  impact 1.0
  title 'daytime STREAM protocol service'
  describe systemd_service('daytime-stream') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-04' do
  impact 1.0
  title 'daytime DGRAM protocol service'
  describe systemd_service('daytime-dgram') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-05' do
  impact 1.0
  title 'echo DGRAM protocol service'
  describe systemd_service('echo-dgram') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-06' do
  impact 1.0
  title 'echo STREAM protocol service'
  describe systemd_service('echo-stream') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end
