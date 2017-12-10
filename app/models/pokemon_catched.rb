class PokemonCatched < ApplicationRecord
	after_initialize :init

	def init
		self.level = 5
	end
end
