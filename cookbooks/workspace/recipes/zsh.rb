package 'zsh'

cookbook_file "/home/#{work_user}/.zshrc" do
  owner work_user
  group work_user
end

execute 'add zsh to shells' do
  command 'echo $(which zsh) >> /etc/shells'
  not_if "grep zsh /etc/shells"
end

execute "chsh -s $(which zsh) #{work_user}" do
  not_if "grep #{work_user} /etc/passwd | grep zsh"
end

