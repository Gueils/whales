require 'whales_cli/feature'

module Whales
  class FeatureCollection

    def initialize(features_attributes)
      puts features_attributes
      @features_attributes = JSON.parse(features_attributes)
    end

    def features
      @features ||= @features_attributes.map do |feature_attributes|
        Whales::Feature.new(feature_attributes)
      end
    end

    def dominant_language
      @dominant_language ||= language_features.max_by { |feature| feature.dig("meta", "ratio").to_f }
    end

    def language_features
      @language_features ||= features.select { |feature| feature.categories.include? "Language" }
    end

    def to_json
      features.map(&:to_json)
    end
  end
end
