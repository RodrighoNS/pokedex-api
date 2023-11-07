namespace :pokemons_bulk_load do
  desc 'Pokemons Bulk Load from PokeAPI into the database'
  task run: :environment do
    if Pokemon.bulk_load
      puts "Pokemons Bulk Load from PokeAPI into the database"
    else
      puts "Error loading pokemons from PokeAPI"
    end
  end
end
