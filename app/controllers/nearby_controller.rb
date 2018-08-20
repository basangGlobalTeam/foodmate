class NearbyController < ApplicationController
  def index
    if params[:km].present?
      @posts = Post.near([params[:lat], params[:lng]], params[:km], units: :km).page(params[:page]).per 10
    end
    @top_likes = Post.joins(:likes)
      .group("posts.id")
      .having("count(likes.id) > 0")
      .order("created_at desc")
      .where(created_at: 1.months.ago..Time.zone.now.to_date)
      .limit 10
    @top_followers = User.joins(:follows)
      .group("users.id")
      .having("count(follows.user_follow_id) > 0")
      .where(created_at: 1.months.ago..Time.zone.now.to_date)
      .where.not(id: current_user.follow_ids)
      .limit 10
  end
end
