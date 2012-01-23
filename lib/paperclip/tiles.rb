module Papercip
  
  class Tiles < Processor
    attr_accessor :tile_size, :format, :basename
    
    def initialize(file, options = {}, attachment = nil)
      super
      @tile_size        = options[:tile_size] || 256
      @format           = 'jpg'
      @basename         = File.basename(file.path, format)
    end
    
    def make
     make_tiles(file)
    end
    
    def make_tiles(src)
      ret = {}
      crops(src).each do |field, crop|
        ret[field.join('_')] = make_tile(src, field, crop)
      end
      ret
    end
    
    def make_tile(src, field, crop)
      dst = Tempfile.new(["#{basename}_#{field.join('_')}", ".#{format}"])
      dst.binmode
      
      Paperclip.run("convert", ":source -crop '#{crop}' :dest", {
        source: "#{File.expand_path(src.path)}[0]",
        dest:   File.expand_path(dst.path)
      })
      
      dst
    end
    
    def crops(src, geo = nil)
      geo ||= Geometry.from_file(src)
      
      ret = {}
      xi = 0
      while (xi*tile_size < geo.width) do
        yi = 0
        while (yi*tile_size< geo.height) do
          size    = [[256, geo.width-xi*tile_size].min.to_i, [256, geo.height-yi*tile_size].min.to_i]
          offset  = [xi*tile_size, yi*tile_size]
          ret[[xi, yi]] = "#{size.join('x')}+#{offset[0]}+#{offset[1]}"
          yi += 1
        end
        xi += 1
      end
      
      ret
    end
    
  end
  
end