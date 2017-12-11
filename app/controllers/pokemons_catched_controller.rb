class PokemonsCatchedController < ApplicationController
	include AuthenticationHelper
	before_action :authenticate_request, only: [:catch]

	def catch
		@pokemon_catched = PokemonCatched.new(pokemon_catched_params)
		@pokemon_catched.user_id = current_user.id

		if @pokemon_catched.save
			render json: @pokemon_catched, status: :created
		else
			render json: @pokemon_catched.errors, status: :unprocessable_entity
		end
	end

	private
		def pokemon_catched_params
			params.require(:pokemons_catched).permit(:user_id, :pokemon_id)
		end
end
