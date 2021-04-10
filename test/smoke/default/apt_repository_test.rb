# frozen_string_literal: true

describe apt('https://packages.microsoft.com/repos/edge') do
  it { should exist }
  it { should be_enabled }
end
