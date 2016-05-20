module Postmen
  class Address < Common

    attr_reader :country,
                :contact_name,
                :phone,
                :fax,
                :email,
                :company_name,
                :street1,
                :street2,
                :street3,
                :city,
                :state,
                :type,
                :postal_code,
                :type,
                :tax_id

    def initialize(options)
      @country = options[:country]
      @contact_name = options[:contact_name]
      @phone = options[:phone]
      @fax = options[:fax]
      @email = options[:email]
      @company_name = options[:company_name]
      @street1 = options[:street1]
      @street2 = options[:street2]
      @street3 = options[:street3]
      @city = options[:city]
      @state = options[:state]
      @type = options[:type]
      @postal_code = options[:postal_code]
      @type = options[:type]
      @tax_id = options[:tax_id]
    end

  end
end