$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'paperclip/tiles/version'

Gem::Specification.new do |s|
  s.name              = "paperclip-tiles"
  s.version           = Paperclip::Tiles::VERSION
  s.platform          = Gem::Platform::RUBY
  s.author            = "Benjamin Huettinger"
  s.email             = ["gems@maxigs.de"]
  s.homepage          = "https://github.com/maxigs/paperclip-tiles"
  s.summary           = "Tile extension for Paperclip to split large images into tiles."
  s.description       = "Tile extension for Paperclip to split large images into tiles."

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

end
