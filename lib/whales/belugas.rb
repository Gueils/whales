module Whales
  class Belugas
    def initialize(path)
      @path = path
    end

    def run
      out = IO.popen(command).read
      collection = Whales::FeatureCollection.new(out)
      Whales::API::Client.dockerfile(collection)
    end

    private

    def command
      "docker run --interactive --tty --rm \
                  --env BELUGAS_CODE=#{ENV['BELUGAS_CODE']} \
                  --volume #{ENV['BELUGAS_CODE']}:/code \
                  --volume /var/run/docker.sock:/var/run/docker.sock \
                  --volume /tmp/fdet:/tmp/fdet icalialabs/belugas analyze . -f json"
    end
  end
end
