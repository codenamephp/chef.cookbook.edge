unified_mode true
property :uri, String, default: 'https://packages.microsoft.com/repos/edge', description: 'The uri of the repository'
property :repo_name, String, default: 'microsoft-edge', description: 'The name of the repo (the name in the sources.list.d folder)'
property :components, Array, default: %w(main)
property :distribution, String, default: 'stable'
property :key, String, default: 'https://packages.microsoft.com/keys/microsoft.asc', description: 'The URL from wehre the key will be downloaded'

action :add do
  execute_resource(:add)
end

action :remove do
  execute_resource(:remove)
end

action_class do
  def execute_resource(action)
    apt_repository new_resource.repo_name do
      uri new_resource.uri
      repo_name new_resource.repo_name
      components new_resource.components
      key new_resource.key
      distribution new_resource.distribution
      action action
    end
  end
end
