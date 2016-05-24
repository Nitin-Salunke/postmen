module Postmen
  class Fedex < Carrier

    attr_reader :billing_account_number

    BILLING = {
        :paid_by => %W(shipper recipient third_party)
    }
    
    PARCEL ={
        :box_type => %w(custom fedex_10kg_box fedex_25kg_box fedex_box fedex_envelope fedex_extra_large_box fedex_large_box fedex_medium_box fedex_pak fedex_small_box fedex_tube)
    }

    def initialize(options)
      super
      @billing_account_number = options[:billing_account_number]
    end

    def retrieve_rates_by_id
      raise NotImplementedError  "Method: retrieve_rates_by_id is not supported by #{self.class.name}."
    end

  end
end