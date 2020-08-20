module Image
  class Base
    def initialize(file, w=100, h=100)
      @file = file
      @width = w
      @height = h
    end

    def check
      @file.content_type.include? 'image/'
    end
  end
end
