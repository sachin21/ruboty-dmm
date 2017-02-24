# coding: utf-8
# frozen_string_literal: true

require 'ruboty'
require 'ruboty/dmm'

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
