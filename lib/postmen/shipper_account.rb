module Postmen
  class ShipperAccount
    include Postmen::Common

    attr_reader :id

    def initialize(options)
      @id = options[:id]
    end
  end
end