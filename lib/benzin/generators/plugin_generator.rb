require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'rails/generators/rails/plugin/plugin_generator'

module Benzin
  class PluginGenerator < Rails::Generators::PluginGenerator
    class_option :database, type: :string, aliases: '-d', default: 'postgresql',
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_test_unit, type: :boolean, aliases: '-T', default: true, desc: 'Skip Test::Unit files'

    class_option :skip_bundle, type: :boolean, aliases: '-B', default: true, desc: "Don't run bundle install"

    class_option :mountable, type: :boolean, default: true, desc: "Generate mountable isolated application"

    class_option :skip_sprockets, type: :boolean, default: true, desc: "Skip Sprockets files"

    class_option :skip_javascript, type: :boolean, aliases: '-J', default: true, desc: "Skip javascript files"

    class_option :dummy_path, type: :string, default: "spec/dummy", desc: "Create dummy application at given path"

    class_option :skip_action_view, type: :boolean, aliases: '-V', default: true, desc: 'Skip Action View files'

    def finish_template
      invoke :benzin_customization
      super
    end

    def benzin_customization
      invoke :hello
      invoke :setup_ruby
      invoke :bundle
      invoke :custom_readme
      invoke :prune_files
      invoke :goodbye
    end

    def setup_ruby
      say "Setting up Ruby..."
      build :create_ruby_version_and_gemset
    end

    def custom_readme
      say "Converting README to markdown..."
      build :readme
    end

    def bundle
      build :bundle
    end

    def prune_files
      say "Removing unneeded files..."
      build :remove_asset_files
      build :remove_html_views
      build :remove_helpers
    end

    def hello
      say "Benzin is fueling your engine..."
    end

    def goodbye
      say "Vroom...Vroom..."
    end

    def noop
    end

    alias :create_public_stylesheets_files :noop
    alias :create_images_directory :noop
    alias :create_javascript_files :noop

    protected

    def get_builder_class
      Benzin::PluginBuilder
    end
  end
end
