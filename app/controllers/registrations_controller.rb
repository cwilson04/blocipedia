class RegistrationsController < Devise::RegistrationsController
  def edit
    super
    raise
  end
end
