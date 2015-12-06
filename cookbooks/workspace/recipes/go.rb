workspace_shellrc 'golang' do
  user node['workspace']['user']
  content <<EOF
export GOPATH=/home/#{node['workspace']['user']}/go
PATH=$GOPATH/bin:$PATH
EOF
end

remote_file '/tmp/go1.5.2.linux-amd64.tar.gz' do
  source 'https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz'
end

execute 'install go' do
  cwd '/usr/local'
  command 'tar xzf /tmp/go1.5.2.linux-amd64.tar.gz'
end
