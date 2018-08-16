class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.new comment_params.merge(user_id: current_user.id)
    if @comment.save
      redirect_back fallback_location: notfound_index_path
    else
      redirect_to notfound_index_path
    end
  end

  def destroy
    @comment = current_user.comments.find_by post_id: @post.id, id: params[:id]
    @comment.destroy
    redirect_back fallback_location: notfound_index_path
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end

  def find_post
    @post = Post.find_by id: params[:post_id]
  end
end
