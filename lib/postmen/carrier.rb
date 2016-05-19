module Postmen
  class Carrier

    PRODUCTION = 'https://sandbox-api.postmen.com/v3'
    SANDBOX = 'https://production-api.postmen.com/v3'

    def initialize(options)
      @api_key = options[:api_key]
      @mode = options[:mode]
      @api_url = get_api_url(options[:mode])
    end

    private
    def get_api_url(mode)
      case mode
        when 'production'
          PRODUCTION
        when 'sandbox'
          SANDBOX
        else
          ''
      end
    end
  end
end