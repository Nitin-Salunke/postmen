module Postmen
  class CreateLabelBase
    include Postmen::Common

    attr_reader :return_shipment,
                :paper_size,
                :service_type

    def initialize(options)
      @return_shipment = options[:return_shipment]
      @paper_size = options[:paper_size] || 'default'
      @service_type = options[:service_type]
    end
  end
end