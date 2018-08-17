class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :date_of_birth, :sex]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :date_of_birth, :sex, :address, :cover, :avatar]
  end

  def layout_by_resource
    if controller_name == "landing"
      "landing"
    elsif devise_controller? && params[:controller] != "devise/registrations" && params[:action] != "edit"
      "login"
    else
      "application"
    end
  end
end
