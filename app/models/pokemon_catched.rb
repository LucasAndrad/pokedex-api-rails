class PokemonCatched < ApplicationRecord
	before_save :init

	# Validations
	validates :level,
		inclusion: { in: 1..100, message: 'Level %{value} is invalid, must be between 1 and 100' }

	# User
	validates :user_id,
		presence: { message: 'User can not be nil' }

	# Pokemon
	validates :pokemon_id,
	presence: { message: 'Pokemon can not be nil' }

	def init
		self.level ||  5
		self.experience || 0
	end
end
