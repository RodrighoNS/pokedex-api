class Pokemon < ApplicationRecord
  before_validation :set_pokemon_id
  validates :name, presence: true

  def self.bulk_load
    puts "Bulk loading pokemons from PokeAPI"
    pokeapi = Pokeapi::Client.new
    response = pokeapi.get_all

    return false if response.empty?

    results = build_pokemon_object(response)

    Pokemon.import results, validate: true
  end

  def self.build_pokemon_object(response)
    response.each do |pokemon|
      puts "New #{pokemon["name"]} from PokeAPI"
      pokemon["pokemon_id"] = pokemon["url"].match(/\/(\d+)\/$/)[1].to_i
    end
  end

  def self.update_fields
    Pokemon.all.map do |pokemon|
      puts "Updating #{pokemon.name} from PokeAPI"
      pokeapi = Pokeapi::Client.new
      response = pokeapi.get("pokemon/#{pokemon.pokemon_id}")

      pokemon.update(
        base_experience: response["base_experience"],
        height: response["height"],
        weight: response["weight"],
        order: response["order"],
        types: response["types"].each {|t| pokemon.types.merge(t) }
      )
    end
  end

  private

  def set_pokemon_id
    last_pokemon = Pokemon.order(pokemon_id: :desc).first

    return true if self.pokemon_id.present?

    self.pokemon_id = last_pokemon.pokemon_id + 1
  end
end
