module Postmen
  module Custom
    class AES
      include Postmen::Common

      attr_reader :type,
                  :itn_number

      def initialize(options)
        @type = options[:type]
        @itn_number = options[:itn_number]
      end
    end
  end
end