class PokemonCatched < ApplicationRecord
	after_initialize :init

	# Validations
	validates :level,
		inclusion: { in: 1..100, message: 'Level %{value} is invalid, must be between 1 and 100' }

	def init
		self.level = 1
	end
end
