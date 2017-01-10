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

control 'accounts-03' do
  title 'Duplicate UIDs'
  desc 'No Duplicate UIDS should be present'
  describe passwd do
    its('uids') { should_not contain_duplicates }
  end
end

control 'accounts-04' do
  title 'Duplicate GIDs'
  desc 'No Duplicate GIDS should be present'
  describe etc_group do
    its('gids') { should_not contain_duplicates }
  end
end

control 'accounts-05' do
  title 'Duplicate usernames'
  desc 'No Duplicate username should be present'
  describe passwd do
    its('users') { should_not contain_duplicates }
  end
end

control 'accounts-06' do
  title 'Duplicate groups'
  desc 'No Duplicate groups should be present'
  describe etc_group do
    its('groups') { should_not contain_duplicates }
  end
end
