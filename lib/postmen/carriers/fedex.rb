module Postmen
  class Fedex < Carrier

    attr_reader :billing_account_number,
                :is_document

    BILLING = {
        :paid_by => %W(shipper recipient third_party)
    }

    def initialize(options)
      super
      @billing_account_number = options[:billing_account_number]
      @is_document = options[:is_document]
    end

    def calculate_rates
      raise NotImplementedError, "Method: calculate_rates is not supported by #{self.class.name}."
    end

    def retrieve_rates_by_id
      raise NotImplementedError, "Method: retrieve_rates_by_id is not supported by #{self.class.name}."
    end

  end
end