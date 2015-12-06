user = node['workspace']['user']
shell = node['workspace']['shell']

rcd = "/home/#{user}/.#{shell}rc.d"
rcfile = "/home/#{user}/.#{shell}rc"

directory rcd do
  user user
  group user
end

execute 'read rc directory' do
  line = ". #{rcd}/*"
  command "echo '#{line}' >> #{rcfile}"
  not_if "grep #{line} #{rcfile}"
end
