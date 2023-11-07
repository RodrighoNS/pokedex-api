class AddFieldsToPokemon < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :base_experience, :integer, null: true
    add_column :pokemons, :height, :float, null: true
    add_column :pokemons, :weight, :float, null: true
    add_column :pokemons, :name, :string, null: false
    add_column :pokemons, :order, :integer, null: true
    add_column :pokemons, :types, :jsonb, default: {}
    add_column :pokemons, :url, :string, null: true
    add_column :pokemons, :pokemon_id, :integer
    add_index :pokemons, :pokemon_id, unique: true
  end
end
