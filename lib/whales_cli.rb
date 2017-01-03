require "thor"
require "json"

require "whales_cli/feature_collection"
require "api/client"

module Whales
  class CLI < Thor
    package_name "belugas-ruby"

    desc "tame", "Belugas tamer"
    def tame
      puts "Nachito"
    end
  end
end

require "whales_cli/version"
