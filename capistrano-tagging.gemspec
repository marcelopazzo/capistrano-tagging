# encoding: utf-8
require File.expand_path('../lib/capistrano/tagging/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'capistrano-tagging'
  s.platform    = Gem::Platform::RUBY
  s.version     = Capistrano::Tagging::VERSION.dup

  s.authors     = ['Dimko', 'Leon Berenschot', 'Marcelo Almeida']
  s.email       = ['deemox@gmail.com', 'LeonB@beriedata.nl', 'contact@marcelopazzo.com']

  s.summary     = "Tag your deployed commit to git"
  s.description = <<-EOF
    Create a tag in the local and remote repo on every deploy
  EOF

  s.homepage    = 'https://github.com/marcelopazzo/capistrano-tagging'

  s.add_dependency 'capistrano', '~> 3.2'

  s.files       = Dir['lib/**/*.rb']
  s.has_rdoc    = false

  s.require_paths = ['lib']
end
