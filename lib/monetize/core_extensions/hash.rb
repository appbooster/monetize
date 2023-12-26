# frozen_string_literal: true

class Hash
  def to_money(currency = nil)
    money_hash = respond_to?(:with_indifferent_access) ? with_indifferent_access : self

    hash_currency = Monetize.send(:calc_hash_currency, money_hash)

    Money.new(money_hash[:cents] || money_hash[:fractional], hash_currency || currency || Money.default_currency)
  end
end
