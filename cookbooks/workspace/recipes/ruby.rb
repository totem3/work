apt_repository 'ruby2.2'do
  uri 'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
end

package 'ruby2.2' do
  options '--force-yes'
end
