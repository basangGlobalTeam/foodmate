class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @image = Image.new image_params.merge(user_id: current_user.id)
    if @image.save
      render json: { message: "success", id: @image.id }, :status => 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    end
  end

  private
  def image_params
    params.require(:image).permit(:file)
  end
end
