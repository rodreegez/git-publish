# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "git-publish/version"

Gem::Specification.new do |s|
  s.name        = "git-publish"
  s.version     = Git::Publish::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = `git log --format='%aN' | sort -u`.split("\n")
  s.email       = ['adam@mintdigital.com']
  s.homepage    = ""
  s.summary     = %q{Easilly publish a topic branch}
  s.description = %q{Easilly publish a topic branch}
  s.rubyforge_project = "git-publish"

  s.add_dependency "grit"
  s.add_development_dependency "rake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
