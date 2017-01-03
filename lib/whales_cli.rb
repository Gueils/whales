require "whales_cli/version"
require "thor"

module Whales
  class CLI < Thor
    package_name "belugas-ruby"

    desc "tame", "Belugas tamer"
    def tame
      puts "Nachito"
    end
  end
end
