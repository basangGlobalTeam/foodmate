class PostsController < ApplicationController
  before_action :post_params, only: [:create]
  before_action :find_post, only: [:show]

  def show
  end

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

  def find_post
    @post = Post.find_by id: params[:id]
    unless @post
      redirect_to root_path
    end
  end
end
