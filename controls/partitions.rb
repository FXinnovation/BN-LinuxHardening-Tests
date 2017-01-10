# encoding: utf-8
# author: Pascal S. Clermont

control 'partitions-01' do
  title 'TMP partition'
  describe mount('/tmp') do
    it { should be_mounted }
    its('options') { should include 'nodev' }
    its('options') { should include 'nosuid' }
    its('options') { should include 'noexec' }
  end
end

control 'partitions-02' do
  title 'Home partition'
  describe mount('/home') do
    it { should be_mounted }
    its('options') { should include 'nodev' }
  end
end

control 'partitions-03' do
  title 'var partition'
  describe mount('/var') do
    it { should be_mounted }
  end
end

control 'partitions-04' do
  title '/var/tmp partition'
  describe mount('/var/tmp') do
    it { should be_mounted }
  end
end

control 'partitions-05' do
  title '/var/log partition'
  describe mount('/var/log') do
    it { should be_mounted }
  end
end

control 'partitions-06' do
  title '/dev/shm partition'
  describe mount('/dev/shm') do
    its('options') { should include 'nosuid' }
    its('options') { should include 'nodev' }
  end
end