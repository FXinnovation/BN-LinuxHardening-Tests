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

control 'service-07' do
  impact 1.0
  title 'tcp port service multiplexer'
  describe systemd_service('tcpmux-server') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-08' do
  impact 1.0
  title 'Very Secure FTP daemon'
  describe systemd_service('vsftpd') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-09' do
  impact 1.0
  title 'Apache httpd service'
  describe systemd_service('httpd') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-10' do
  impact 1.0
  title 'The Avahi mDNS/DNS-SD daemon'
  describe systemd_service('avahi-daemon') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'service-11' do
  impact 1.0
  title 'Common Unix Printing System services'
  describe systemd_service('cups') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
  describe systemd_service('cups-lpd') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end
