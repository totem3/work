package 'vim-gtk'

directory "/home/#{work_user}/.vim" do
  owner work_user
  group work_user
end

directory "/home/#{work_user}/.vim/bundle" do
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


cookbook_file "/home/#{work_user}/.vimrc" do
  owner work_user
  group work_user
end

"/home/#{work_user}/.vimrc.d".tap do |vimdir|
  %w{.vimrc.basic .vimrc.bundle .vimrc.complete}.each do |file|
    cookbook_file "#{vimdir}/#{file}" do
      owner work_user
      group work_user
    end
  end
end
