# encoding: utf-8
# author: Pascal S. Clermont


control 'audit-01' do
  title 'Audit configuration Immutable'
  desc 'the Audit Configuration should be Immutable'
  describe auditd_rules do
    its('lines') { should contain_match(%r{-e 2}) }
  end
end
