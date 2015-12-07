shell = node['workspace']['shell']

rcd = "/home/#{work_user}/.#{shell}rc.d"
rcfile = "/home/#{work_user}/.#{shell}rc"

directory rcd do
  user work_user
  group work_user
end

execute 'read rc directory' do
  line = ". #{rcd}/*"
  command "echo '#{line}' >> #{rcfile}"
  not_if "grep #{line} #{rcfile}"
end
