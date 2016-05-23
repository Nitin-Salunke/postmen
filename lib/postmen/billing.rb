module Postmen
  class Billing
    include Postmen::Common

    attr_reader :paid_by,
                :method

    def initialize(options)
      @paid_by = options[:paid_by]
      @method = options[:method]
    end
  end
end