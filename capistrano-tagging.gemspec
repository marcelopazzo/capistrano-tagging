# encoding: utf-8
require File.expand_path("../lib/capistrano/tagging/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "capistrano-tagging"
  s.platform    = Gem::Platform::RUBY
  s.version     = Capistrano::Tagging::VERSION

  s.authors     = ["Leon Berenschot"]
  s.email       = ["LeonB@beriedata.nl"]

  s.summary     = "Tag your deployed commit to git"
  s.description = <<-EOF
    With every commit tag the local and remote branch with a tag
  EOF

  s.date        = "2011-01-31"
  s.homepage    = "http://github.com/dimko/capistrano-tagging"

  s.add_dependency "capistrano", ">= 1.0.0"

  s.files       = `git ls-files`.split("\n")
  s.has_rdoc    = false

  s.require_path = 'lib'
end
