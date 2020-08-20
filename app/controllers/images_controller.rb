class ImagesController < ApplicationController
  def info
    service = Image::Base.new(images_params[:file])
    if service.image?
      render json: { success: true, data: service.info }
    else
      render json: { success: false, message: 'File is blank or not an image' }
    end
  end

  def resize
    service = Image::Resize.new(images_params[:file])
    if service.image?
      image_file = service.call(images_params[:width], images_params[:height])
      data = open("#{Rails.root}/tmp/#{image_file}")
      send_data data.read, filename: image_file, type: service.content_type, disposition: 'inline',  stream: 'true', buffer_size: '4096'
    else
      render json: { success: false, message: 'File is blank or not an image' }
    end
  end

  private

  def images_params
    params.permit(:file, :width, :height)
  end
end
