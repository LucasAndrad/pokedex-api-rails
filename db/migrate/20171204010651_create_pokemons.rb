class CreatePokemons < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :name
      t.string :type_1
      t.string :type_2
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :sp_atk
      t.integer :sp_def
      t.integer :speed
      t.integer :generation
      t.boolean :legendary
      t.string :image

      t.timestamps
    end
  end
end
