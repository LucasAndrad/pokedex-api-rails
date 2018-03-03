class CreatePokemonCatcheds < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemon_catcheds do |t|
      t.integer :level
      t.integer :experience
			t.belongs_to :pokemon, index: true
			t.belongs_to :user, index: true
			
      t.timestamps
    end
  end
end
