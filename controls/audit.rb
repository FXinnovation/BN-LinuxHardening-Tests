# encoding: utf-8
# author: Pascal S. Clermont


control 'audit-01' do
  title 'Audit configuration Immutable'
  desc 'the Audit Configuration should be Immutable'
  describe auditd_rules do
    its('lines') { should contain_match(%r{-e 2}) }
  end
end

control 'audit-02' do
  title 'Audit Date / time'
  desc 'the Audit Configuration should Record Events That Modify Date and Time Information'
  describe auditd_rules do
    its('lines') { should contain_match(%r{-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change}) }
    its('lines') { should contain_match(%r{-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change}) }
    its('lines') { should contain_match(%r{-a always,exit -F arch=b64 -S clock_settime -k time-change}) }
    its('lines') { should contain_match(%r{-a always,exit -F arch=b32 -S clock_settime -k time-change}) }
    its('lines') { should contain_match(%r{-w /etc/localtime -p wa -k time-change}) }
  end
end

control 'audit-03' do
  title 'Audit network'
  desc 'the Audit Configuration should Record Events That Modify System\'s Network Environment'
  describe auditd_rules do
    its('lines') { should contain_match(%r{-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale}) }
    its('lines') { should contain_match(%r{-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale}) }
    its('lines') { should contain_match(%r{-w /etc/issue -p wa -k system-locale}) }
    its('lines') { should contain_match(%r{-w /etc/issue.net -p wa -k system-locale}) }
    its('lines') { should contain_match(%r{-w /etc/hosts -p wa -k system-locale}) }
    its('lines') { should contain_match(%r{-w /etc/sysconfig/network -p wa -k system-locale}) }
  end
end