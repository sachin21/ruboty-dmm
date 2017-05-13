# coding: utf-8
# frozen_string_literal: true

require 'ruboty'
require 'ruboty/dmm'

require 'pry'

RSpec.configure do |config|
  config.order = 'random'

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
