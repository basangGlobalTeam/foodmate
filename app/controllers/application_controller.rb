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
end
