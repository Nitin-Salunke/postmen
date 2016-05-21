module Postmen
  class Customs
    include Postmen::Common

    attr_reader :purpose,
                :terms_of_trade,
                :eei,
                :billing,
                :importer_address,
                :passport

    def initialize(options)
      @purpose = options[:purpose]
      @terms_of_trade = options[:terms_of_trade]
      @eei = options[:eei]
      @billing = options[:billing]
      @importer_address = options[:importer_address]
      @passport = options[:passport]
    end
  end
end