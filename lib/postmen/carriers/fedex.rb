module Postmen
  class Fedex < Carrier

    attr_reader :billing_account_number

    BILLING = {
        :paid_by => %W(shipper recipient third_party)
    }
    
    PARCEL ={
        :box_type => %w(custom fedex_10kg_box fedex_25kg_box fedex_box fedex_envelope fedex_extra_large_box fedex_large_box fedex_medium_box fedex_pak fedex_small_box fedex_tube)
    }
    
    SERVICE_TYPE = %w(fedex_2_day fedex_2_day_am fedex_2_day_am_one_rate fedex_2_day_one_rate fedex_distance_deferred fedex_europe_first_international_priority fedex_express_saver fedex_express_saver_one_rate fedex_first_overnight fedex_first_overnight_one_rate fedex_ground fedex_ground_home_delivery fedex_international_economy fedex_international_first fedex_international_priority fedex_next_day_afternoon fedex_next_day_early_morning fedex_next_day_end_of_day fedex_next_day_mid_morning fedex_priority_overnight fedex_priority_overnight_one_rate fedex_same_day fedex_same_day_city fedex_standard_overnight fedex_standard_overnight_one_rate)

    def initialize(options)
      super
      @billing_account_number = options[:billing_account_number]
    end

    def retrieve_rates_by_id
      raise NotImplementedError  "Method: retrieve_rates_by_id is not supported by #{self.class.name}."
    end

  end
end