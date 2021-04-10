require 'spec_helper'

describe 'codenamephp_php_sury_repository' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_edge_package

  context 'With minimal properties' do
    recipe do
      codenamephp_edge_package 'Install package'
    end

    it {
      is_expected.to install_package('Install edge package').with(package_name: 'microsoft-edge-dev')
    }
  end

  context 'Remove with minimal properties' do
    recipe do
      codenamephp_edge_package 'Remove package' do
        action :remove
      end
    end

    it {
      is_expected.to remove_package('Remove edge package').with(package_name: 'microsoft-edge-dev')
    }
  end

  context 'Install with custom package name' do
    recipe do
      codenamephp_edge_package 'Install package' do
        package_name 'some package'
      end
    end

    it {
      is_expected.to install_package('Install edge package').with(package_name: 'some package')
    }
  end

  context 'Remove with minimal properties' do
    recipe do
      codenamephp_edge_package 'Remove package' do
        package_name 'some package'
        action :remove
      end
    end

    it {
      is_expected.to remove_package('Remove edge package').with(package_name: 'some package')
    }
  end
end
