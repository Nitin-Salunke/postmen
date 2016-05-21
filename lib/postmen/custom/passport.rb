module Postmen
  module Custom
    class Passport
      include Postmen::Common

      attr_reader :number,
                  :issue_date

      def initialize(options)
        @number = options[:number]
        @issue_date = options[:issue_date]
      end
    end
  end
end