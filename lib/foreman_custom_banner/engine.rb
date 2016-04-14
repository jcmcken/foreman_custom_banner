module ForemanCustomBanner
  class Engine < ::Rails::Engine
    isolate_namespace ForemanCustomBanner

    initializer 'foreman_custom_banner.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path('../../../app/models/settings/custom_banner.rb', __FILE__) if \
        (Setting.table_exists? rescue(false))
    end

    initializer 'foreman_custom_banner.register_plugin', :before => :finisher_hook do |app|
      Foreman::Plugin.register :foreman_custom_banner do
        requires_foreman '>= 1.9'
      end
    end
  end
end
