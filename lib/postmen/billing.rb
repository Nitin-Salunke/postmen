module Postmen
  class Billing
    include Postmen::Common

    attr_reader :pai_by,
                :method

    def initialize(options)
      @pai_by = options[:paid_by]
      @method = options[:method]
    end
  end
end