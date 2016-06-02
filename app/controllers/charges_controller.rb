class ChargesController < ApplicationController
 
 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 10000
   }
 end
 
  def create
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: 10000,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
   
   current_user.update_attributes(role: 'premium')
 
   flash[:notice] = "Thanks for signing up for a Premium Account, #{current_user.email}!"
   redirect_to user_path(current_user) 
   
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end
end
