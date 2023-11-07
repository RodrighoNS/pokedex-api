class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]

  # GET /pokemons
  def index
    @pokemons = Pokemon.all

    render jsonapi: @pokemons
  end

  # GET /pokemons/1
  def show
    render jsonapi: @pokemon
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render jsonapi: @pokemon, status: :created, location: @pokemon
    else
      render jsonapi: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render jsonapi: @pokemon
    else
      render jsonapi: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy!
    render json: { message: "Pokemon deleted" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find_by(pokemon_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.fetch(:pokemon, {}).permit!
    end
end
