def whyrun_supported?
  true
end

action :create do
  shell = node['workspace']['shell']
  Chef::Log.info("create #{shell}rc")
  directory  "/home/#{work_user}/.#{shell}rc.d" do
    owner work_user
    group work_user
  end
  @new_resource.updated_by_last_action(true)

  if @new_resource.source and @new_resource.content
    Chef::Application.fatal!("you cannot specify both source and content")
  end

  path = "/home/#{@new_resource.user}/.#{shell}rc.d/#{@new_resource.name}"
  if @new_resource.source
    source = @new_resource.source
    user = @new_resource.user
    cookbook_file path do
      source source
      owner user
      group user
      mode 0644
    end
  end

  if @new_resource.content
    content = @new_resource.content
    user = @new_resource.user
    file path do
      content content
      owner user
      group user
      mode 0644
    end
  end
end

action :delete do
  file @new_resource.source do
    action :delete
  end
end
