class RegistrationsController < Devise::RegistrationsController
  layout "application", only: [:edit, :update]
  layout "login", only: [:new]

  protected

  def update_resource(resource, params)
    if params[:password].blank?
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end

  end
  def after_update_path_for(resource)
    user_path(resource)
  end
end
