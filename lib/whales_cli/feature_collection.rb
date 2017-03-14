require 'whales_cli/feature'

module Whales
  class FeatureCollection

    def initialize(features_attributes)
      @features_attributes = JSON.parse(features_attributes)
    end

    def features
      @features ||= @features_attributes.map do |feature_attributes|
        Whales::Feature.new(feature_attributes)
      end
    end

    def dominant_language
      @dominant_language ||= if rails? || sinatra? || middleman?
                               language_features.select { |feature| feature["name"] == "Ruby" }[0]
                             elsif django?
                               language_features.select { |feature| feature["name"] == "Python" }[0]
                             elsif laravel? || codeignater? || yii? || cakephp? || zend?
                               language_features.select { |feature| feature["name"] == "PHP" }[0]
                             else
                               max_ratio_language
                             end
    end

    def language_features
      @language_features ||= features.select { |feature| feature.categories.include? "Language" }
    end

    def to_json
      features.map(&:to_json)
    end

    private

    def max_ratio_language
      @max_ratio_language ||= language_features.max_by { |feature| feature.dig("meta", "ratio").to_f }
    end

    def django?
      frameworks.map { |f| f["name"] }.include? "django"
    end

    def rails?
      frameworks.map { |f| f["name"] }.include? "rails"
    end

    def middleman?
      frameworks.map { |f| f["name"] }.include? "middleman"
    end

    def sinatra?
      frameworks.map { |f| f["name"] }.include? "sinatra"
    end

    def laravel?
      frameworks.map { |f| f["name"] }.include? "laravel"
    end

    def codeignater?
      frameworks.map { |f| f["name"] }.include? "codeignater"
    end

    def cakephp?
      frameworks.map { |f| f["name"] }.include? "cakephp"
    end

    def yii?
      frameworks.map { |f| f["name"] }.include? "yii"
    end

    def zend?
      frameworks.map { |f| f["name"] }.include? "zend"
    end

    def frameworks
      @frameworks ||= features.select {|feature| feature.categories.include? "Framework" }
    end
  end
end
