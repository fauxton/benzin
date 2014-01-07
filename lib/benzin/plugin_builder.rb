module Benzin
  module RubyVersion
    MAJOR = "2.1"
    PATCH_LEVEL = "0"
  end

  class PluginBuilder < Rails::PluginBuilder
    def app
      directory 'app'
      empty_directory_with_keep_file 'app/models'
      empty_directory_with_keep_file 'app/controllers'
    end

    def bundle
      run "rvm use #{ruby}@#{name}"
      run "bundle install"
    end

    def create_ruby_version_and_gemset
      run "rvm --create --ruby-version #{ruby}"
      run "rvm gemset create #{name}"
    end

    def remove_asset_files
      remove_dir "app/assets"
    end

    def readme
      remove_file "README.rdoc"
      template("README.md.erb", "README.md", force: true)
    end

    def remove_html_views
      remove_dir "app/views"
    end

    def remove_helpers
      remove_dir "app/helpers"
    end

    def ruby
      "ruby-#{RubyVersion::MAJOR}-p#{RubyVersion::PATCH_LEVEL}"
    end
  end
end
