class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_params, only: [:create]
  before_action :find_post, only: [:show]

  def show
    @comments = @post.comments.order(id: :desc).page(params[:page]).per 10
  end

  def create
    @post = current_user.posts.new post_params
    @post.image_ids = params[:post][:image_ids]
    @post.food_ids = params[:post][:food_ids]
    if @post.save
      flash[:success] = "新しい投稿を投稿しました。"
      redirect_to post_path @post
    else
      flash[:error] = "エラーがあるので、もう一度お願いします。"
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
      redirect_to notfound_index_path
    end
  end
end
