# encoding: utf-8
# author: Pascal S. Clermont

control 'samhain-01' do
  title 'samhain database'
  desc 'samhain database should be ok.'
  describe command('/usr/local/sbin/samhain -t check -p warn --foreground') do
    its('exit_status') { should eq 0 }
    its('stderr') { should match(%r{status\=\<exit_success\>}) }
  end
end

control 'samhain-02' do
  title 'samhain configuration'
  desc 'samhain configuration should be our file.'
  describe file('/etc/samhainrc') do
    its('md5sum') { should eq '3209d5b437036b1de871a4a59c348346' }
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should be_readable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_readable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('other') }
  end
end
