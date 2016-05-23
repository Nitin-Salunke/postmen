module Postmen
  class Weight
    include Postmen::Common

    attr_reader :value,
                :unit

    def initialize(options)
      @value = options[:value],
      @unit = options[:unit]
    end
  end
end