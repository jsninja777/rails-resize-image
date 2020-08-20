class ImagesController < ApplicationController
  def info
    @file = images_params[:file]
    puts @file.content_type.include? 'image/'
  end

  private

  def images_params
    params.permit(:file)
  end
end
