require 'rails_helper'

RSpec.describe PokemonsCatchedController, type: :controller do
	describe 'Pokemons Catched controller methods' do

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
			@charmander = Pokemon.first
			@charmeleon = Pokemon.find_by(name: 'Charmeleon')
			@charizard = Pokemon.find_by(name: 'Charizard')
			@user = User.create(name: 'Ash Katchum', email: 'ash@email.com', password: '123456', age: 10)
		end

		it 'Should block a unauthorized user to catch a Pokemon' do
			post :catch, params: { pokemons_catched: { pokemon_id: @charizard.id, user_id: @user.id, level: 42 }}
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:unauthorized)
			expect(json['error']).to eq('Not Authorized')
		end

		it 'Should catch a Pokemon with id = 3' do
			subject.class.skip_before_action :authenticate_request
			post :catch, params: { pokemons_catched: { pokemon_id: @charizard.id, user_id: @user.id, level: 42 }}
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:created)
			expect(json['level']).to be(42)
		end

		it 'Should not catch a Pokemon with id = 1' do
			post :catch, params: { pokemons_catched: { pokemon_id: @charmander.id, user_id: @user.id, level: 420 }}
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:unprocessable_entity)
			expect(json['level'][0]).to eq('Level 420 is invalid, must be between 1 and 100')
		end

		it 'Should level up pokemon Charmeleon' do
			pokemon_catched = PokemonCatched.create(pokemon_id: @charmeleon.id, user_id: @user.id, level: 29)
			put :level_up, params: { id: pokemon_catched.id }
			json = JSON.parse(response.body)
			expect(response).to have_http_status(:accepted)
			expect(json['level']).to be(30)
		end

	end
end
