package 'vim-gtk'

directory "/home/#{work_user}/.vim/bundle" do
  recursive true
  owner work_user
  group work_user
end

git "/home/#{work_user}/.vim/bundle/neobundle.vim" do
  repository 'https://github.com/Shougo/neobundle.vim'
  revision 'master'
  user work_user
  group work_user
end

directory "/home/#{work_user}/.vimrc.d" do
  owner work_user
  group work_user
end

cookbook_file "/home/#{work_user}/.vimrc"

cookbook_file "/home/#{work_user}/.vimrc.d/.vimrc.basic"
cookbook_file "/home/#{work_user}/.vimrc.d/.vimrc.bundle"
cookbook_file "/home/#{work_user}/.vimrc.d/.vimrc.complete"
