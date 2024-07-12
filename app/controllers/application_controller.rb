class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  before_action :authenticate_user!
         
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :address, :comment, :user_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password, :address, :comment, :user_image])
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      root_path
    else
      flash[:notice] = "新規登録完了しました" 
      new_user_path
    end
  end

end
