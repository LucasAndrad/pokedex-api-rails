Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Users
	resources :users
	get 'users/:id/pokemons' => 'users#show_pokemons'
	
	# Pokemons
	resources :pokemons do
		get 'search', on: :collection
	end

	# Pokemon Catched
	post 'catch' => 'pokemons_catched#catch'
	put 'level_up/:id' => 'pokemons_catched#level_up'

	# Authentication
	post 'authenticate', to: 'authentication#authenticate'
end
