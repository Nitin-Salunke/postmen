module Postmen
  module Common

    def to_hash
      hash = {}
      instance_variables.map do |var|
        value = instance_variable_get(var)
        if instance_variable_get(var)
          hash[var[1..-1].to_sym] = if value.is_a?(Array)
                                      value.collect{|val|
                                        (val.class.to_s.include?('Postmen') ? val.to_hash : val)
                                      }
                                    else
                                      (value.class.to_s.include?('Postmen') ? value.to_hash : value)
                                    end
        end
      end
      hash
    end

  end
end