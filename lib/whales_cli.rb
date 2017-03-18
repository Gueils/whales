require "thor"
require "json"

require "whales_cli/feature_collection"
require "api/client"
require "whales/belugas"

module Whales
  class CLI < Thor
    package_name "belugas-ruby"

    desc "tame", "Belugas tamer"
    method_option :env, aliases: "-e", type: :string, required: false
    method_option :path, aliases: "-p", type: :string, required: false

    def tame
      Whales::Belugas.new(options).run
    end
  end
end

require "whales_cli/version"
