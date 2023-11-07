class SerializablePokemon < JSONAPI::Serializable::Resource
  type 'pokemon'
  id { @object.pokemon_id }
  attributes :pokemon_id, :name, :base_experience, :height, :weight, :order, :types, :url, :updated_at, :created_at
end
