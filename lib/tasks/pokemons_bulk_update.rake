namespace :pokemons_bulk_update do
  desc 'Pokemons Bulk update'
  task run: :environment do
    if Pokemon.update_fields
      puts "Pokemons Bulk update success"
    else
      puts "Error loading pokemons from PokeAPI"
    end
  end
end
