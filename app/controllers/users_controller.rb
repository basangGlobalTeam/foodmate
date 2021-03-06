class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: :show

  def show
    @posts = @user.posts.order(id: :desc).page(params[:page]).per 10
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:error] = "ユーザーがありません"
      redirect_to notfound_index_path
    end
  end
end
