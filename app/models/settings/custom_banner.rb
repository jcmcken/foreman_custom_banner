class Setting::CustomBanner < ::Setting
  def self.load_defaults
    return unless ActiveRecord::Base.connection.table_exists?('settings')
    return unless super

    Setting.transaction do
      [
        self.set('custom_banner_text', N_('Text to set on the custom banner'), nil)
      ].compact.each { |s| self.create s.update(:category => "Setting::CustomBanner") }
    end

    true
  end
end
