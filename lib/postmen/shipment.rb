module Postmen
  class Shipment
    include Postmen::Common

    attr_reader :ship_from,
                :ship_to,
                :parcels

    def initialize(options)
      @ship_from = options[:ship_from]
      @ship_to = options[:ship_to]
      @parcels = options[:parcels]
    end
  end
end