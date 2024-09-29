class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception


         
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :address, :comment, :user_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password, :address, :comment, :user_image])
  end

  private

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end