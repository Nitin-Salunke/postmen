module Postmen
  class ServiceOptionCOD
    include Postmen::Common

    attr_reader :type,
                :cod_value

    def initialize(options)
      @type = options[:type]
      @cod_value = options[:cod_value]
    end
  end
end