require 'httparty'

module Whales
  module API
    class Client
      include HTTParty
      base_uri ENV["API_BASE_URI"]

      def self.dockerfile(feature_collection)
        response = self.post "/#{feature_collection.dominant_language.name.downcase}/#{feature_collection.dominant_language.version}/dockerize", body: { features: feature_collection.to_json }

        if response.success?
          puts response
        else
          puts response.to_json
        end
      end
    end
  end
end
