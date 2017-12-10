Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Users
	resources :users
	
	# Pokemons
	resources :pokemons do
		get 'search', on: :collection
	end

	# Pokemon Catched
	post 'catch' => 'pokemons_catched#catch'

	# Authentication
	post 'authenticate', to: 'authentication#authenticate'
end
