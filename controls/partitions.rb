# encoding: utf-8
# author: Pascal S. Clermont

control 'partitions-01' do
  title 'TMP partition'
  describe mount('/tmp') do
    it { should be_mounted }
  end
end