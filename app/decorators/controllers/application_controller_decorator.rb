ApplicationController.class_eval do
  helper_method :custom_banner_text

  def custom_banner_text
    Setting.custom_banner_text
  end
end
