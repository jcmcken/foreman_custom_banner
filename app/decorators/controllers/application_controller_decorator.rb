ApplicationController.class_eval do
  helper_method :custom_banner_text, :custom_banner_enabled, :custom_banner_style

  def custom_banner_text
    Setting.custom_banner_text
  end

  def custom_banner_enabled
    !!Setting.custom_banner_enabled
  end

  def custom_banner_style
    Setting.custom_banner_style
  end
end
