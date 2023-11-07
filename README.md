# Pokedex API

This is a RESTful JSON API to index and manage Pokemons from all generations.

## Requirements

```
# ruby --version
ruby 3.0.1p64

# rails --version
Rails 7.1.1
```

## Installation

1. Clone the repository and move to the folder:

```
https://github.com/RodrighoNS/pokedex_api.git

cd pokedex_api
```

2. Install the dependencies:

```
bundle install
```

3. Set up the database:

```
rails db:create
rails db:migrate
```

4. Populate the database using rake task in this same order:

```
# Pokemons Bulk Load from PokeAPI into the database
rake pokemons_bulk_load:run

# Pokemons Bulk update
rake pokemons_bulk_update:run
```

5. Start the server:

```
rails s
```
