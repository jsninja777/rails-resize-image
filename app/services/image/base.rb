module Image
  class Base
    attr_accessor :file, :image, :info

    def initialize(file)
      @file = file
    end

    def image?
      @file&.content_type&.include? 'image/'
    end

    def content_type
      @file&.content_type
    end

    def info
      @info ||= {
        type: image.type,
        size: image.size,
        width: image.width,
        height: image.height
      }
    end

    def image
      @image ||= MiniMagick::Image.open(@file.tempfile.path)
    end
  end
end
