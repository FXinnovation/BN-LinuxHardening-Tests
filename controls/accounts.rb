# encoding: utf-8
# author: Pascal S. Clermont

control 'accounts-01' do
  title 'System Accounts'
  desc 'system accounts should not be able to login'
  describe passwd.shells('/bin/bash') do
    its('uids') { should_not include(/^[1-9][0-9]?[0-9]?$/) }
  end
  describe passwd.shells('/bin/sh') do
    its('uids') { should_not include(/^[1-9][0-9]?[0-9]?$/) }
  end
end

control 'accounts-02' do
  title 'Empty Passwords'
  desc 'no user should have an empty password.'
  describe shadow do
    its('passwords') { should_not contain '' }
  end
end
