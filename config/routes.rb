Rails.application.routes.draw do
	
	# Pokemons routes
	resources :pokemons do
		get 'search', on: :collection
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
