# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/dmm/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-dmm'
  spec.version       = Ruboty::DMM::VERSION
  spec.authors       = ['Satoshi Ohmori']
  spec.email         = ['sachin21dev@gmail.com']

  spec.summary       = "A bot for DMM R18's rankings"
  spec.description   = "A bot for DMM R18's rankings for 24, weeks, months"
  spec.homepage      = 'https://github.com/sachin21/ruboty-dmm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'
  spec.add_runtime_dependency 'dmm-crawler', '0.0.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
