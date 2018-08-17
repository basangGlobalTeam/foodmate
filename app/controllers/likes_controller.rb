class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like, only: :destroy

  def create
    @post.likes.new user_id: current_user.id
    if @post.save
      redirect_to post_path @post
    else
      redirect_to notfound_index_path
    end
  end

  def destroy
    if @like.destroy
      redirect_to post_path @post
    else
      redirect_to notfound_index_path
    end
  end

  private
  def find_post
    @post = Post.find_by id: params[:post_id]
    unless @post
      redirect_to notfound_index_path
    end
  end

  def find_like
    @like = @post.likes.find_by id: params[:id]
  end
end
