class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :set_stripe, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    user_path(current_user)
  end
  
  private
  
  def user_not_authorized
    flash[:alert] = 'Access denied'
    redirect_to root_path
  end
  
  def set_stripe
       @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership",
     amount: 10000
   }
  end
end
