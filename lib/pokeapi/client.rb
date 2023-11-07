module Pokeapi
  class Client
    OFFSET = 0.freeze
    LIMIT = 1292.freeze

    def initialize
      @BASE_URL = Rails.application.credentials.development[:pokeapi_base_url]
    end

    def get_all
      response = get("pokemon?offset=#{OFFSET}&limit=#{LIMIT}")
      response["results"]
    end

    def get(path)
      response = connection.get(path)
      JSON.parse response.body
    end

    def connection
      Faraday.new(
        url: @BASE_URL,
        headers: {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }
      )
    end
  end
end
