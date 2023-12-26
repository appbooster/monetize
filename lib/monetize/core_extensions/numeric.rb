# frozen_string_literal: true

class Numeric
  def to_money(currency = nil)
    Monetize.from_numeric(self, currency || Money.default_currency)
  end
end
