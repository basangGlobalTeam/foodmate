class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.newfeeds.page(params[:page]).per 10

    @top_likes = Post.joins(:likes)
      .group("posts.id")
      .having("count(likes.id) > 0")
      .order("created_at desc")
      .where(created_at: 1.months.ago..Time.zone.now.to_date)
      .limit 10

    @top_comments = Post.joins(:comments)
      .group("posts.id")
      .having("count(comments.id) > 0")
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
