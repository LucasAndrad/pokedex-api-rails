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
	end
end