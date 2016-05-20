module Postmen
  class Parcel
    include Postmen::Common

    attr_reader :box_type,
                :dimension,
                :items,
                :description,
                :weight

    def initialize(options)
      @box_type = options[:box_type]
      @dimension = options[:dimension]
      @items = options[:items]
      @description = options[:description]
      @weight = options[:weight]
    end
  end
end