module Postmen
  class Item
    include Postmen::Common

    attr_reader :description,
                :quantity,
                :price,
                :weight,
                :item_id,
                :origin_country,
                :sku,
                :hs_code

    def initialize(options)
      @description = options[:description]
      @quantity = options[:quantity]
      @price = options[:price]
      @weight = options[:weight]
      @item_id = options[:item_id]
      @origin_country = options[:origin_country]
      @sku = options[:sku]
      @hs_code = options[:hs_code]
    end

  end
end