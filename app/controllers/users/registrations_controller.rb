class Users::RegistrationsController < Devise::RegistrationsController

  def cancel
    super
  end
 
  def create
    super
  end
 
  def new
    super
  end

  def edit
    super
  end
 
  def update
    super
  end
 
  def destroy
    super
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(:nickname, :profile, :works, :avatar, :group)
  end

end
