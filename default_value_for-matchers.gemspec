$:.unshift File.expand_path('../lib', __FILE__)

require 'default_value_for/matchers/version'

Gem::Specification.new do |s|
  s.name        = 'default_value_for-matchers'
  s.version     = DefaultValueFor::Matchers::VERSION
  s.authors     = 'kami'
  s.email       = 'kami30k@gmail.com'

  s.summary     = 'RSpec matchers for default_value_for gem.'
  s.description = 'RSpec matchers for default_value_for gem.'
  s.homepage    = 'https://github.com/kami30k/default_value_for-matchers'
  s.license     = 'MIT'

  s.files       = `git ls-files -z`.split("\x0")
end
