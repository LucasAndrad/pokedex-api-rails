class PokemonsController < ApplicationController
	include AuthenticationHelper
	before_action :authenticate_request, only: [:index, :create, :update, :destroy]
	before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    @pokemons = Pokemon.all

    render json: @pokemons
  end

  # GET /pokemons/1
	def show
    render json: @pokemon
	end
	
	# Search endpoint method from:
	# http://www.bentedder.com/creating-a-basic-autocomplete-search-endpoint-in-ruby-on-rails/
	def search
		term = params[:term] || nil
		@pokemons = []
		@pokemons = Pokemon.where('name LIKE ? OR number LIKE ? OR type_1 LIKE ? OR type_2 LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")
		render json: @pokemons
	end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

	private
	
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pokemon_params
      params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary, :image)
    end
end
