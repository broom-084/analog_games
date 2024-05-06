# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :public_state, only: [:create]

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected
  
  def users_state
    users = Users.find_by(email: params[:users][:email])
    return if users.nil?
    return unless users.valid_password?(params[:users][:password])
    
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
