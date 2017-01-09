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

