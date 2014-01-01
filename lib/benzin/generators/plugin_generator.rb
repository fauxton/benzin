require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'rails/generators/rails/plugin_new/plugin_new_generator'

module Benzin
  class PluginGenerator < Rails::Generators::PluginNewGenerator
    class_option :database, :type => :string, :aliases => '-d', :default => 'postgresql',
      :desc => "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_test_unit, :type => :boolean, :aliases => '-T', :default => true,
      :desc => 'Skip Test::Unit files'

    class_option :skip_bundle, :type => :boolean, :aliases => '-B', :default => true,
      :desc => "Don't run bundle install"

    def finish_template
      invoke :benzin_customization
      super
    end

    def benzin_customization
      invoke :goodbye
    end

    def goodbye
      say "That's all folks!"
    end
  end
end
