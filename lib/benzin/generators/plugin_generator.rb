require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'rails/generators/rails/plugin_new/plugin_new_generator'

module Benzin
  class PluginGenerator < Rails::Generators::PluginNewGenerator
    class_option :database, type: :string, aliases: '-d', default: 'postgresql',
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_test_unit, type: :boolean, aliases: '-T', default: true, desc: 'Skip Test::Unit files'

    class_option :skip_bundle, type: :boolean, aliases: '-B', default: true, desc: "Don't run bundle install"

    class_option :mountable, type: :boolean, default: true, desc: "Generate mountable isolated application"

    class_option :skip_sprockets, type: :boolean, default: true, desc: "Skip Sprockets files"

    class_option :dummy_path, type: :string, default: "spec/dummy", desc: "Create dummy application at given path"

    def finish_template
      invoke :benzin_customization
      super
    end

    def benzin_customization
      invoke :hello
      invoke :goodbye
    end

    def hello
      say "Benzin is fueling your engine..."
    end

    def goodbye
      say "Vroom...Vroom..."
    end
  end
end
