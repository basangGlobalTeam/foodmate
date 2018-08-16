class PostsController < ApplicationController
  before_action :post_params, only: [:create]

  def create
    @post = current_user.posts.new post_params
    @post.image_ids = params[:post][:image_ids]
    if @post.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private
  def post_params
    params.require(:post).permit :image_ids, :content, :restaurant, :address
  end
end
