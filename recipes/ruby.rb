git "rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
  destination "/home/vagrant/.rbenv"
  action :sync
end


git "ruby-build" do
  repository https://github.com/sstephenson/ruby-build.git
  destination "/home/vagrant/.rbenv/plugins/ruby-build"
  action :sync
end
