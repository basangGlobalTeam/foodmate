class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per 10
  end
end
