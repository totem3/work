def whyrun_supported?
  true
end

action :create do
  Chef::Log.info("create bashrc")
  @new_resource.updated_by_last_action(true)

  if @new_resource.source and @new_resource.content
    Chef::Application.fatal!("you cannot specify both source and content")
  end

  path = "/home/#{@new_resource.user}/.bashrc.d/#{@new_resource.name}" 
  if @new_resource.source
    cookbook_file path do
      source @new_resource.source
      owner @new_resource.user
      group @new_resource.user
      mode 0644
    end
  end

  if @new_resource.content
    file path do
      content = @new_resource.content
      owner @new_resource.user
      group @new_resource.user
      mode 0644
    end
  end
end

action :delete do
  file @new_resource.source do
    action :delete
  end
end
