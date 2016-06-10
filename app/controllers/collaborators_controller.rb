class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    # load user by email Model.where(prop: this).first
    @user = User.where(email: params[:email]).first
    # there could be no user, load error
      if @user.nil?
        flash[:notice] = "Collaborator email not found"

      # user is self, load error
      elsif @user == current_user
        flash[:alert] = "Cannot use self as collaborator"
       
      # user present and no collaborator, create collaborator, flash notice - .create return true if successful, false otherwise
      elsif Collaborator.where(wiki: @wiki, user: @user).first != nil
        flash[:notice] = "User is already a collaborator"
      elsif @collaborator = Collaborator.new(wiki: @wiki, user: @user)
        @collaborator.save
        flash[:success] = "Collaborator was added successfully"
        
      # something went wrong, load error
      else
        flash[:alert] = "Something went wrong. Please try again"
        
      end
    redirect_to edit_wiki_path(@wiki)
  end
  
  def destroy
     @wiki = Wiki.find(params[:wiki_id])
     @user = User.where(email: params[:email])
     @collaborator = Collaborator.find(params[:id])
 
     if @collaborator.destroy
       flash[:notice] = "Collaborator was deleted successfully."

     else
       flash[:alert] = "Collaborator could not be deleted. Try again."

     end
     redirect_to edit_wiki_path(@wiki)
  end
end
