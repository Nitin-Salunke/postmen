module Postmen
  module Custom
    class NoEEI
      include Postmen::Common

      attr_reader :type,
                  :ftr_exemption

      def initialize(options)
        @type = options[:type]
        @ftr_exemption = options[:ftr_exemption]
      end
    end
  end
end