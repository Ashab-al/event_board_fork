class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  before_action :set_locale

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:username, :name, :email, :password, :password_confirmation]
    )
    devise_parameter_sanitizer.permit(
      :account_update, 
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def current_user_can_edit?(model, action=nil)
    action_model = action || model
    return unless user_signed_in?
    return true if model.user == current_user
  
    model.try(action.class.to_s.downcase).try(:user) == current_user
  end
end
