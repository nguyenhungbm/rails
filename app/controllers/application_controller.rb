class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :logged_in?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :phone, :email, :password) }
  end

  def authorized
    redirect_to "/users/sign_in" unless user_signed_in?
  end

  def logged_in?
    user_signed_in?
  end
end
