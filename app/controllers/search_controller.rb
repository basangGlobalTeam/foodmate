class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    param! :query, String, default: ""
    param! :type, String, in: %w(user post), transform: :downcase, default: "user"
    param! :food_ids, String, default: "*"

    @type = params[:type]

    if params[:type] == 'user'
      @results = User.search params[:query], hitsPerPage: 10, page: params[:page]
    else
      @results = Post.search params[:query], hitsPerPage: 10, page: params[:page]
    end
  end
end
