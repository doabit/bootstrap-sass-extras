# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap-sass-extras/version'

Gem::Specification.new do |gem|
  gem.name          = "bootstrap-sass-extras"
  gem.version       = BootstrapSassExtras::VERSION
  gem.authors       = ["doabit"]
  gem.email         = ["doinsist@gmail.com"]
  gem.description   = %q{bootstrap-sass extras.}
  gem.summary       = %q{bootstrap-sass extras.}
  gem.homepage      = "https://github.com/doabit/bootstrap-sass-extras"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", ">= 3.1.0"

  gem.add_development_dependency "rspec-rails"
  gem.add_development_dependency "sqlite3"
end
