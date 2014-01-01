module Benzin
  module RubyVersion
    MAJOR = "2.1"
    PATCH_LEVEL = "0"
  end

  class PluginBuilder < Rails::PluginBuilder
    def bundle
      run "rvm use #{ruby}@#{app_name}"
      run "bundle install"
    end

    def create_ruby_version_and_gemset
      run "rvm --create --ruby-version #{ruby}"
    end

    def ruby
      "ruby-#{RubyVersion::MAJOR}-p#{RubyVersion::PATCH_LEVEL}"
    end
  end
end
