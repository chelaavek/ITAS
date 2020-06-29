class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(admin_users)
    root_path
  end

  def after_sign_out_path_for(admin_users)
    root_path
  end

  def authenticate_admin_user!
    raise SecurityError unless current_admin_user && current_admin_user.role=='admin'
  end

  rescue_from SecurityError do |exception|
    redirect_to root_path
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
end
