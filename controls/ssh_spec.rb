# encoding: utf-8
# author: Pascal S. Clermont

control 'ssh-01' do
  title 'SSHd configuration'
  desc "sshd configuration should comply with best practices"
  describe sshd_config do
    its('Protocol') { should cmp 2 }
    its('IgnoreRhosts') { should eq 'yes' }
    its('HostbasedAuthentication') { should eq 'no' }
    its('PermitRootLogin') { should eq 'no' }
    its('PermitEmptyPasswords') { should eq 'no' }
    its('PubkeyAuthentication') { should eq 'yes' }
    its('PasswordAuthentication') { should eq 'no' }
    its('X11Forwarding') { should eq 'no' }
    its('MaxAuthTries') { should eq '5' }
    its('Ciphers') { should cmp('aes128-ctr,aes192-ctr,aes256-ctr') }
    its('ClientAliveInterval') { should eq '900' }
    its('ClientAliveCountMax') { should eq '0' }
    its('UsePAM') { should eq 'yes' }
    its('LogLevel') { should eq 'INFO' }
  end
end
