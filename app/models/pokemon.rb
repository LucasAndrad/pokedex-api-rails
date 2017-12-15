class Pokemon < ApplicationRecord
	has_many :pokemon_catched

	# Validations
	validates :name,
		presence: { message: 'Name is required' }
end
