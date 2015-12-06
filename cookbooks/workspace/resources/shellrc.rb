actions :create, :delete
default_action :create

attribute :user, :kind_of => String, :required => true
attribute :source, :kind_of => String
attribute :content, :kind_of => String
