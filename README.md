# Postmen

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/postmen`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postmen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postmen

## Usage

Example COD Fedex label creation.

    require 'postmen'
    
    x = Postmen::Fedex.new({:api_key => '85ee2a63-XXXX-4936-9623-XXXXXXXX4066', :mode => 'sandbox', :async => false, :is_document => false, :shipper_account_ids => ['db77XXXX-3c89-48c4-b655-XXXXXX34e186']})
    base = Postmen::Base::CreateLabel.new({:return_shipment => false, :paper_size => '4x6', :service_type => 'fedex_express_saver'})
    invoice = Postmen::Invoice.new({:date => '2016-06-23', :number => 'INV123'})
    messages = ['Handle with care']
    
    billing = Postmen::Billing.new({:paid_by => 'shipper'})
    
    ship_from = Postmen::Address.new({:country => 'IND',
                                      :contact_name => 'Abc Xyz',
                                      :phone => '9898989898',
                                      :email => 'abc@xyz.com',
                                      :company_name => 'XYZ company Pvt ltd',
                                      :street1 => 'Main street Abde faria road',
                                      :street2 => 'Add your address line 2.',
                                      :city => 'Margao',
                                      :state => 'Goa',
                                      :postal_code => '403601',
                                      :type => 'residential',
                                      :tax_id => '1234567'
                                     })
    
    ship_to = Postmen::Address.new({:country => 'IND',
                                    :contact_name => 'Nitin Salunke',
                                    :phone => '9898989898',
                                    :email => 'nitin@ecomnation.in',
                                    :company_name => 'ecomnation',
                                    :street1 => 'MG Road Near West Side super stores',
                                    :street2 => 'Add your address line 2',
                                    :state => 'Goa',
                                    :postal_code => '403602',
                                    :type => 'residential'
                                   })
    
    item = Postmen::Item.new({
                                 :description => 'Item sample 1',
                                 :quantity => 1,
                                 :price => Postmen::Money.new({:amount => 10, :currency => 'INR'}),
                                 :weight => Postmen::Weight.new({:value => 1, :unit => 'kg'}),
                                 :origin_country => 'IND',
                                 :sku => 'SAMPLE'
                             })
    items = [item]
    parcel = Postmen::Parcel.new({
        :box_type => 'custom',
        :dimension => Postmen::Dimension.new({:width => 40,
                                               :height => 10,
                                               :depth => 10,
                                               :unit => 'cm'
                                              }),
        :items => items,
        :description => 'Sample postmen parcel',
        :weight => Postmen::Weight.new({:value => 1, :unit => 'kg'})
    })
    parcels = [parcel]
    shipment = Postmen::Shipment.new({:ship_from => ship_from, :ship_to => ship_to, :parcels => parcels})
    customs = Postmen::Customs.new({:purpose => 'merchandise'})
    cod_service_option = Postmen::ServiceOptionCOD.new({:type => 'cod',:cod_value => Postmen::Money.new({:amount => 10, :currency => 'INR'})})
    service_options = [cod_service_option]
    
    x.create_label(base, invoice, messages, billing, shipment, service_options, customs)


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nitin-Salunke/postmen. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

