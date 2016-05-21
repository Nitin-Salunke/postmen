module Postmen
  class Invoice
    include Postmen::Common

    attr_reader :date,
                :number,
                :type,
                :number_of_copies

    def initialize(options)
      @date = options[:date] # In YYYY-MM-DD format
      @number = options[:number]
      @type = options[:type]
      @number_of_copies = options[:number_of_copies]
    end
  end
end