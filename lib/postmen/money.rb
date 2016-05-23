module Postmen
  class Money
    include Postmen::Common

    attr_reader :amount,
                :currency

    def initialize(options)
      @amount = options[:amount],
      @currency = options[:currency]
    end
  end
end