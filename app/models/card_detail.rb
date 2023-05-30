class CardDetail < ApplicationRecord
	belongs_to :user
	enum :card_type, [:credit_card, :debit_card]
end