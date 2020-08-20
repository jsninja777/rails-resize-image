module Image
  class Resize < Base
    def call(w, h)
      w = (w || 100).to_f
      h = (h || 100).to_f

      w_original = image[:width].to_f
      h_original = image[:height].to_f

      if (w_original * h != h_original * w)
        if w_original * h >= h_original * w
          w_result = w
          h_result = w_result * (h_original / w_original)
        elsif w_original * h <= h_original * w
          h_result = h
          w_result = h_result * (w_original / h_original)
        end
      else
        h_result = h
        w_result = w
      end

      image.resize("#{w_result}x#{h_result}")
      image.write("#{Rails.root}/tmp/#{filename}")

      filename
    end

    def filename
      @filename ||= "output.#{info[:type].downcase}"
    end
  end
end
