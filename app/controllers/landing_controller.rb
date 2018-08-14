class LandingController < ApplicationController
    def index
        redirect_to home_index_path if user_signed_in?
        render layout: "layouts/landing"
    end
end