class PokemonsCatchedController < ApplicationController
	include AuthenticationHelper
	before_action :authenticate_request, only: [:catch, :level_up]

	def catch
		@pokemon_catched = PokemonCatched.new(pokemon_catched_params)
		if !current_user.nil?
			@pokemon_catched.user_id = current_user.id
		end
		if @pokemon_catched.save
			render json: @pokemon_catched, status: :created
		else
			render json: @pokemon_catched.errors, status: :unprocessable_entity
		end
	end

	def level_up
		@pokemon_catched = PokemonCatched.find(params[:id])
		pokemon_level = @pokemon_catched.level + 1
		@pokemon_catched.update_columns(level: pokemon_level)
		if @pokemon_catched.save
			render json: @pokemon_catched, status: :accepted
		else
			render json: @pokemon_catched.errors, status: :unprocessable_entity
		end
	end

	private
		def pokemon_catched_params
			params.require(:pokemons_catched).permit(:user_id, :pokemon_id, :level)
		end
end
