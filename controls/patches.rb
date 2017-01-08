control 'verify-patches' do
  impact 0.3
  title 'All patches should be installed'
  describe linux_update do
    it { should be_uptodate}
  end
end

control 'patches' do
  impact 0.3
  title 'All updates are installed'
  linux_update.updates.each { |update|
    describe package(update['name']) do
      its('version') { should eq update['version']}
    end
  }
end
