class FollowersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:index]

  def index
    @users = @user.followers.order(id: :desc).page(params[:page]).per 8
  end

  private
  def find_user
    @user = User.find_by id: params[:user_id]
    unless @user
      redirect_to notfound_index_path
    end
  end
end
