# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dtk-common-core/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rich PELAVIN"]
  gem.email         = ["rich@reactor8.com"]
  gem.description   = %q{DTK Common Core is a shared library used by several DTK components.}
  gem.summary       = %q{Common libraries used for DTK CLI client.}
  gem.homepage      = "https://github.com/rich-reactor8/dtk-common-repo"
  gem.licenses      = ["Apache-2.0"]

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dtk-common-core"
  gem.require_paths = ["lib"]
  gem.version       = DtkCommonCore::VERSION

  gem.add_dependency 'rest-client','1.6.7'
end
