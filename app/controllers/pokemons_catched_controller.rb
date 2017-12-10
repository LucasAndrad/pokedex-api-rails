class PokemonsCatchedController < ApplicationController

	def catch
		@pokemon_catched = PokemonCatched.new(pokemon_catched_params)
		
		if @pokemon_catched.save
			render json: @pokemon_catched, status: :created
		else
			render json: @pokemon_catched.errors, status: :unprocessable_entity
		end
	end

	private
		def pokemon_catched_params
			params.require(:pokemons_catched).permit(:user_id, :pokemon_id, :level)
		end
end
