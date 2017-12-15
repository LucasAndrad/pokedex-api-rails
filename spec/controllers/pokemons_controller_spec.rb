require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
	describe 'Pokemons controller methods' do
		before(:each) do
			Pokemon.create([
				{ number:4, name: 'Charmander', type_1: 'Fire', type_2: '', total:309, hp:39, 
					attack: 52, defense: 43, sp_atk: 60, sp_def: 50, speed: 65, generation: 1, 
					legendary:0, image: '0004.png' },
				{ number: 5, name: 'Charmeleon', type_1: 'Fire', type_2: '', total: 405, hp: 58, 
					attack: 64, defense: 58, sp_atk: 80, sp_def: 65, speed: 80, generation: 1, 
					legendary:0, image: '0005.png' },
				{ number: 6, name: 'Charizard', type_1:' Fire', type_2: 'Flying', total: 534, hp: 78, 
					attack: 84, defense: 78, sp_atk: 109, sp_def: 85, speed: 100, generation: 1, 
					legendary: 0, image: '0006.png' }
		])
		@pokemon = Pokemon.first
		end

		it 'Should get http status 200 for /pokemons' do
			get :index
			expect(response).to have_http_status(200)
		end

		it 'Should get pokemons json for /pokemons' do
			get :index
			json = JSON.parse(response.body)
			expect(json.length).to be(3)
			expect(json[2]['name']).to eq('Charizard')
		end

		it 'Should get a Pokemon with id = 1 from /pokemons/1' do
			get :show, params: { id: Pokemon.first.id }
			json = JSON.parse(response.body)
			expect(response).to have_http_status(200)
			expect(json['name']).to eq('Charmander')
		end

		it 'Should search for Charmeleon' do
			get :search, params: { term: 'Charmeleon' }
			json = JSON.parse(response.body)
			expect(response).to have_http_status(200)
			expect(json[0]['name']).to eq('Charmeleon')
		end

		it 'Should not create new Pokemon, Articuno, not authorized' do
			post :create, params: { pokemon: { number:144, name:"Articuno", type_1:"Ice", type_2:"Flying", total:580, hp:90, attack:85, defense:100, sp_atk:95, sp_def:125, speed:85, generation:1, legendary:1, image:"0144.png" }}
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:unauthorized)
		end

		it 'Should not create new Pokemon, Articuno, name is nil' do
			subject.class.skip_before_action :authenticate_request
			post :create, params: { pokemon: { number:144, name: nil, type_1:"Ice", type_2:"Flying", total:580, hp:90, attack:85, defense:100, sp_atk:95, sp_def:125, speed:85, generation:1, legendary:1, image:"0144.png" }}
			json = JSON.parse(response.body)
			expect(json['name'][0]).to eq('Name is required')
		end

		it 'Should create new Pokemon, Articuno' do
			post :create, params: { pokemon: { number:144, name:"Articuno", type_1:"Ice", type_2:"Flying", total:580, hp:90, attack:85, defense:100, sp_atk:95, sp_def:125, speed:85, generation:1, legendary:1, image:"0144.png" }}
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:created)
			expect(json['name']).to eq('Articuno')
		end

		it 'Should update Pokemon with id = 1' do
			put :update, params: { id: @pokemon, pokemon: { type_1:"Ice Cold", type_2:"Flying Dragon" }}
			json = JSON.parse(response.body)
			expect(json['type_2']).to eq('Flying Dragon')
		end

		it 'Should not update Pokemon with id = 1' do
			put :update, params: { id: @pokemon, pokemon: { name: nil }}
			json = JSON.parse(response.body)
			expect(json['name'][0]).to eq('Name is required')
		end

		it 'Should destroy the existing Pokemon with id = 1' do
			all_pokemons = User.count
			delete :destroy, params: { id: @pokemon }
			expect(User.count).to be(0)
		end

	end
end