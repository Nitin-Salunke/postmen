module Postmen
  class ServiceOptionInsurance
    include Postmen::Common

    attr_reader :type,
                :insured_value

    def initialize(options)
      @type = options[:type]
      @insured_value = options[:insured_value]
    end
  end
end