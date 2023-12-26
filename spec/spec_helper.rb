# frozen_string_literal: true

require 'money'
require 'byebug'
RSpec.configure do |config|
  Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
  Money.default_currency = 'USD'
  config.order = 'random'
end
