require 'ostruct'

module Whales
  class Feature < OpenStruct

    def to_json
      self.marshal_dump
    end
  end
end
