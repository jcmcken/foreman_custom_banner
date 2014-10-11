# -*- encoding: utf-8 -*-
require File.expand_path('../lib/foreman_custom_banner/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jon McKenzie"]
  gem.email         = ["jcmcken@gmail.com"]
  gem.description   = %q{Plugin for Foreman that adds a custom banner}
  gem.summary       = %q{Plugin for Foreman that adds a custom banner}
  gem.homepage      = "https://github.com/jcmcken/foreman_custom_banner"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "foreman_custom_banner"
  gem.require_paths = ["lib"]
  gem.version       = ForemanCustomBanner::VERSION

  gem.add_runtime_dependency "deface"
end
