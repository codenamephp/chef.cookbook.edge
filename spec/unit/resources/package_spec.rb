require 'spec_helper'

describe 'codenamephp_php_sury_repository' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_edge_apt_repository

  context 'With minimal properties' do
    recipe do
      codenamephp_edge_apt_repository 'add repository'
    end

    it {
      is_expected.to add_apt_repository('microsoft-edge').with(
        uri: 'https://packages.microsoft.com/repos/edge',
        repo_name: 'microsoft-edge',
        components: %w(main),
        distribution: 'stable',
        key: ['https://packages.microsoft.com/keys/microsoft.asc']
      )
    }
  end

  context 'Remove with minimal properties' do
    recipe do
      codenamephp_edge_apt_repository 'add repository' do
        action :remove
      end
    end

    it {
      is_expected.to remove_apt_repository('microsoft-edge').with(
        uri: 'https://packages.microsoft.com/repos/edge',
        repo_name: 'microsoft-edge',
        components: %w(main),
        distribution: 'stable',
        key: ['https://packages.microsoft.com/keys/microsoft.asc']
      )
    }
  end
end
