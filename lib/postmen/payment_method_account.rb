module Postmen
  class PaymentMethodAccount
    include Postmen::Common

    attr_reader :type,
                :account_number,
                :postal_code,
                :country

    def initialize(options)
      @type = options[:type]
      @account_number = options[:account_number]
      @postal_code = options[:postal_code]
      @country = options[:country]
    end
  end
end