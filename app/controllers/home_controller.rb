class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.newfeeds.page(params[:page]).per 10
  end
end
