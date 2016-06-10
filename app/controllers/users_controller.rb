class UsersController < ApplicationController
  
  def show
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 1000
   }
  end
  
  def downgrade
    current_user.update_attribute(:role, 'standard')
    current_user.wikis.each do |wiki|
        if wiki.private? == true
            wiki.private == false
        else
            wiki.private? == false
        end
        redirect_to user_path
    end
  end
end
