property :package_name, String, default: 'microsoft-edge-dev', description: 'The name of the apt package'

action :install do
  package 'Install edge package' do
    package_name new_resource.package_name
  end
end

action :remove do
  package 'Remove edge package' do
    package_name new_resource.package_name
    action :remove
  end
end
