# encoding: utf-8
require File.expand_path('../lib/capistrano/tagging/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'capistrano-tagging'
  s.platform    = Gem::Platform::RUBY
  s.version     = Capistrano::Tagging::VERSION.dup

  s.authors     = ['Dimko', 'Leon Berenschot']
  s.email       = ['deemox@gmail.com', 'LeonB@beriedata.nl']

  s.summary     = "Tag your deployed commit to git"
  s.description = <<-EOF
    Create a tag in the local and remote repo on every deploy
  EOF

  s.homepage    = 'http://github.com/dimko/capistrano-tagging'

  s.add_dependency 'capistrano', '~> 2.0'

  s.files       = `git ls-files`.split("\n")
  s.has_rdoc    = false

  s.require_paths = ['lib']
end
