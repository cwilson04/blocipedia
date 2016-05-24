class UsersController < ApplicationController
  
  def show
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 1000
   }
  end
  
end
