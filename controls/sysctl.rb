# encoding: utf-8
# author: Pascal S. Clermont


control 'sysctl-01' do
  impact 1.0
  title 'IPv4 Forwarding'
  desc "If you're not intending for your system to forward traffic between interfaces, or if you only have a single interface, the forwarding function must be disable."
  describe kernel_parameter('net.ipv4.ip_forward'{ do
    its(:value) { should eq 0 }
  end
  describe kernel_parameter('net.ipv4.conf.all.forwarding') do
    its(:value) { should eq 0 }
  end
  describe file('/etc/sysctl.conf') do
    its('content') { should match(%r{net.ipv4.ip_forward.*0})  }
  end
  describe file('/etc/sysctl.conf') do
    its('content') { should match(%r{net.ipv4.conf.all.forwarding.*0})  }
  end
end
