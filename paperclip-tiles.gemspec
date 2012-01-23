Gem::Specification.new do |s|
  s.name      = 'paperclip-tiles'
  s.version   = '0.0.0'
  s.platform  = Gem::Platform::RUBY
  s.author    = 'Benjamin Huettinger'
  s.email     = 'benjamin.huettinger@gmail.com'
  s.homepage  = 'https://github.com/maxigs/paperclip-tiles'
  s.summary   = 'Tile extension for Paperclip to split large images into tiles.'

  s.files     = ['lib/paperclip/tiles.rb']

  s.add_runtime_dependency('paperclip')
end
