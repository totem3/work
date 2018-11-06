package 'git'

git "#{Chef::Config[:file_cache_path]}/vim" do
  repository 'https://github.com/vim/vim'
  revision 'master'
  action :sync
end

execute 'install build depends' do
  user 'root'
  command 'apt-get build-dep -y --allow-unauthenticated vim'
end

package %w{
  lua5.3
  python3
  python3-dev
  python3-pip
}
configure_opts = %w{
--with-features=huge
--enable-luainterp
--enable-python3interp
--enable-ruby-interp
--enable-fail-if-missing
}.join(" ")
execute 'build vim' do
  user 'root'
  command "./configure #{configure_opts} && make && sudo make install"
  cwd "#{Chef::Config[:file_cache_path]}/vim"
end
