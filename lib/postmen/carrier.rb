require 'uri'
require 'net/http'

module Postmen
  class Carrier

    PRODUCTION = 'https://sandbox-api.postmen.com/v3'
    SANDBOX = 'https://production-api.postmen.com/v3'

    def initialize(options)
      @api_key = options[:api_key]
      @mode = options[:mode]
      @api_url = get_api_url(options[:mode])
      @async = options[:async]
    end

    def calculate_rates
    end

    def retrieve_rates_by_id
    end

    def create_label
    end

    def retrieve_label_by_id
    end

    def list_all_label
    end

    def cancel_label
    end

    def list_all_cancel_labels
    end

    def retrieve_cancel_label_by_id
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


    def process_request(url, body = nil)
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request['postmen-api-key'] = '8fc7966b-679b-4a57-911d-c5a663229c9e'
      request['content-type'] = 'application/json'
      request.body = body if body.present?

      http.request(request)
    end
  end
end