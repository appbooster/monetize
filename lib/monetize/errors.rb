# frozen_string_literal: true

module Monetize
  class Error < StandardError; end

  class ParseError < Error; end
  class ArgumentError < Error; end
end
