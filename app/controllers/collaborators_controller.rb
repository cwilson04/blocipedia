class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new
    # redirect back where we came from
    redirect_to wiki.edit
    # load wiki
    
    # load user by email Model.where(prop: this).first
    @user = User.where(email: params[:email]).first
    # there could be no user, load error
    if @user.email == nil
      flash[:notice] = "Collaborator email not found"
    # there could be a user, but already collaborator, load error 
    
    # user is self, load error
    elsif @user == self.user
      flash[:notice] = "Cannot use self as collaborator"
    # user present and no collaborator, create collaborator, flash notice - .create return true if successful, false otherwise
    elsif @user.email == @collaborator.email
      @collaborator.save
      flash[:success] = "Collaborator was added successfully"
    # something went wrong, load error
    else
      flash[:notice] = "Something went wrong. Please try again"
      redirect_to edit_wiki_path
    
  end
  
  def destroy
    
  end
end
