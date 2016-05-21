module Postmen
  class ServiceOptionGeneral
    include Postmen::Common

    attr_reader :type,
                :enabled

    def initialize(options)
      @type = options[:type]
      @enabled = options[:enabled]
    end
  end
end