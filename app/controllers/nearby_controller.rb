class NearbyController < ApplicationController
  def index
    if params[:km].present?
      @posts = Post.near([params[:lat], params[:lng]], params[:km], units: :km).page(params[:page]).per 1
    end
  end
end
