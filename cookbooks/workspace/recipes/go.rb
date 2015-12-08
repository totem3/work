workspace_shellrc 'golang' do
  user work_user
  content <<EOF
export GOPATH=/home/#{work_user}/go
PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
EOF
end

remote_file '/tmp/go1.5.2.linux-amd64.tar.gz' do
  source 'https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz'
end

execute 'install go' do
  cwd '/usr/local'
  command 'tar xzf /tmp/go1.5.2.linux-amd64.tar.gz'
end

bash 'go get -u github.com/nsf/gocode' do
  code 'go get -u github.com/nsf/gocode'
  user work_user
  environment 'GOPATH' => "/home/#{work_user}/go", 'PATH' => "/usr/local/go/bin:#{ENV['PATH']}"
end
