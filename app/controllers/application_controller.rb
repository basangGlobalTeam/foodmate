class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    if controller_name == "landing"
      "landing"
    elsif devise_controller?
      "login"
    else
      "application"
    end
  end
  
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_up, keys: [:name, :sex, :date_of_birth]
  end

end
