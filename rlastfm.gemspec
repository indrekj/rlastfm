# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rlastfm/version"

Gem::Specification.new do |s|
  s.name        = "rlastfm"
  s.version     = RLastFM::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Indrek Juhkam"]
  s.email       = ["indrek@urgas.eu"]
  s.homepage    = "http://rubygems.org/gems/rlastfm"
  s.summary     = %q{A Ruby wrapper for Last.fm API}
  s.description = %q{}

  s.rubyforge_project = "rlastfm"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "httparty"
end
