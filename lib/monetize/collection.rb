# frozen_string_literal: true

require 'forwardable'

module Monetize
  class Collection
    extend Forwardable
    include Enumerable
    def_delegators :@list, :[], :each, :last

    attr_reader :input, :currency, :options

    def self.parse(input, currency = Money.default_currency, options = {})
      new(input, currency, options).parse
    end

    def initialize(input, currency = Money.default_currency, options = {})
      raise ArgumentError, 'Input must be a string' unless input.respond_to? :strip

      @input = input.clone.strip

      @currency = currency
      @options = options
      @list = []
    end

    def parse
      @list = if range?
                split_range.map { |fragment| Monetize.parse(fragment, currency, options) }
              else
                split_list.map { |fragment| Monetize.parse(fragment, currency, options) }
              end

      self
    end

    def range?
      RANGE_SPLIT =~ input
    end

    private

    LIST_SPLIT = %r{[/,]}
    RANGE_SPLIT = /-/

    def split_list
      @input.split(LIST_SPLIT).map(&:strip)
    end

    def split_range
      @input.split(RANGE_SPLIT).map(&:strip)
    end
  end
end
