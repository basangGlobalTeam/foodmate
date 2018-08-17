class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:create, :destroy]
  before_action :find_follow, only: [:destroy]

  def create
    current_user.follows.new user_follow_id: @user.id
    if current_user.save
      redirect_back fallback_location: notfound_index_path
    else
      redirect_to notfound_index_path
    end
  end

  def destroy
    if @follow.destroy
      redirect_back fallback_location: notfound_index_path
    else
      redirect_to notfound_index_path
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:user_id]
    unless @user
      redirect_to notfound_index_path
    end
  end

  def find_follow
    @follow = current_user.follows.find_by id: params[:id]
  end
end
