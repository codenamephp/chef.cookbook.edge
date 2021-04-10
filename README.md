# Chef Cookbook
[![CI](https://github.com/codenamephp/chef.cookbook.edge/actions/workflows/ci.yml/badge.svg)](https://github.com/codenamephp/chef.cookbook.edge/actions/workflows/ci.yml)

Cookbook to install the Microsoft Edge browser

## Requirements

### Supported Platforms

- Debian Stretch

## Usage

Add the cookbook to your Berksfile or Metadata:

```
cookbook 'codenamephp_edge'
```

Then use the resources to add the repository:

```ruby
codenamephp_edge_apt_repository 'Add apt repository'
```

## Resources

### apt_respository
This resource manages (adds/removes) the apt repository from which the package will be installed

#### Actions
- `:add`: Adds the apt repository to apt
- `:remove`: Removes the repository from apt (does not remove any installed packages!)

#### Properties
- `uri`: The uri to the repository, default: 'https://packages.microsoft.com/repos/edge'
- `repo_name`: The name of the repo (the name in the sources.list.d folder), default: 'microsoft-edge'
- `components`: The components to add to the repository, default: %w(main)
- `distribution`: The distribution to add to the repository, default: 'stable'
- `key`: The URL from wehre the key will be downloaded, default: 'https://packages.microsoft.com/keys/microsoft.asc'

#### Examples
```ruby
# Minmal parameters
codenamephp_edge_apt_repository 'Add apt repository'

# Remove the repository
codenamephp_edge_apt_repository 'Remove apt repository' do
  action :remove
end
```