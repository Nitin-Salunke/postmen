require 'uri'
require 'net/http'

module Postmen
  class Carrier

     SANDBOX = 'https://sandbox-api.postmen.com/v3'
     PRODUCTION = 'https://production-api.postmen.com/v3'

    attr_reader :api_key,
                :mode,
                :api_url,
                :async,
                :is_document,
                :shipper_account_ids #Array of multiple shipper account id's

    def initialize(options)
      @api_key = options[:api_key]
      @mode = options[:mode]
      @api_url = get_api_url(options[:mode])
      @async = options[:async]
      @is_document = options[:is_document]
      @shipper_account_ids = options[:shipper_account_ids]
    end

    def calculate_rates(shipment)
      request_body = {
          async: self.async,
          is_document: self.is_document
      }
      shipper_accounts = []
      self.shipper_account_ids.each do |account|
        shipper_accounts << {id: account}
      end
      request_body.merge!(shipper_accounts: shipper_accounts)
      request_body.merge!(shipment: shipment.to_hash)
      process_request("#{api_url}/rates", 'POST', request_body)
    end

    def retrieve_rates_by_id
      raise NotImplementedError, "Method: retrieve_rates_by_id is not supported by #{self.class.name}."
    end

    def create_label(base, invoice, messages, billing, shipment, service_options = nil, customs = nil)
      request_body = {
          async: self.async,
          is_document: self.is_document
      }
      request_body.merge!(base.to_hash)
      request_body.merge!(invoice: invoice.to_hash)
      request_body.merge!(references: messages) #Reference messages for shipment.
      request_body.merge!(shipper_account: {id: self.shipper_account_ids.first})
      request_body.merge!(billing: billing.to_hash)
      request_body.merge!(shipment: shipment.to_hash)
      request_body.merge!(service_options: service_options.collect{|options| options.to_hash}) unless service_options.empty?
      request_body.merge!(customs: customs.to_hash) if customs
      process_request("#{api_url}/labels", 'POST', request_body)
    end

    def retrieve_label_by_id
      raise NotImplementedError, "Method: retrieve_label_by_id is not supported by #{self.class.name}."
    end

    def list_all_label
      raise NotImplementedError, "Method: list_all_label is not supported by #{self.class.name}."
    end

    def cancel_label
      raise NotImplementedError, "Method: cancel_label is not supported by #{self.class.name}."
    end

    def list_all_cancel_labels
      raise NotImplementedError, "Method: list_all_cancel_labels is not supported by #{self.class.name}."
    end

    def retrieve_cancel_label_by_id
      raise NotImplementedError, "Method: retrieve_cancel_label_by_id is not supported by #{self.class.name}."
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


    def process_request(url, method, body = nil)
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = case method
                  when 'GET'
                    Net::HTTP::Get.new(url)
                  when 'POST'
                    Net::HTTP::Post.new(url)
                end
      request['postmen-api-key'] = api_key
      request['content-type'] = 'application/json'
      request.body = body.to_json if body
      response = http.request(request)
      JSON.parse(response.body)
    end
  end
end