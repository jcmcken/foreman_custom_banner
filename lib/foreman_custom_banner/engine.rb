module ForemanCustomBanner
  class Engine < ::Rails::Engine

    config.to_prepare do
      Dir.glob(Rails.root + 'app/decorators/**/*_decorator*.rb').each do |c|
        require_dependency(c)
      end
    end

    initializer 'foreman_custom_banner.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path('../../../app/models/settings/custom_banner.rb', __FILE__) if \
        (Setting.table_exists? rescue(false))
    end

    initializer 'foreman_custom_banner.load_data' do |app|
      app.config.paths['db/migrate'] += ForemanCustomBanner::Engine.paths['db/migrate'].existent
    end
  end
end
