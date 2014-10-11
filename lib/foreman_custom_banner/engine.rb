module ForemanCustomBanner
  class Engine < ::Rails::Engine
    isolate_namespace ForemanCustomBanner

    config.to_prepare do
      Dir.glob(Rails.root + 'app/decorators/**/*_decorator*.rb').each do |c|
        require_dependency(c)
      end
    end

    initializer 'foreman_custom_banner.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path('../../../app/models/settings/custom_banner.rb', __FILE__) if \
        (Setting.table_exists? rescue(false))
    end

    initializer 'foreman_custom_banner.register_plugin', :after => :finisher_hook do |app|
      Foreman::Plugin.register :foreman_custom_banner do
        requires_foreman '>= 1.5'
      end
    end
  end
end
