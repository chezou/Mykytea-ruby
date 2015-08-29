# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kytea/version'

Gem::Specification.new do |spec|
  spec.name          = "kytea"
  spec.version       = Kytea::VERSION
  spec.authors       = ["Michiaki Ariga"]
  spec.email         = ["chezou+github@gmail.com"]

  spec.summary       = %q{An text analysis toolkit KyTea binding.}
  spec.description   = "An text analysis toolkit KyTea binding."
  spec.homepage      = "http://github.com/chezou/Mykytea-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.extensions    = ["ext/extconf.rb"]
  spec.require_paths = ["ext", "lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
