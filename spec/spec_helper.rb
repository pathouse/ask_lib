require 'rspec'
require 'ask_lib'

RSpec.configure do |c|
  c.expect_with :rspec do |expect_config|
    expect_config.syntax = :expect
  end
end
