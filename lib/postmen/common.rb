module Postmen
  module Common

    def to_hash
      hash = {}
      instance_variables.map do |var|
        value = instance_variable_get(var)
        if instance_variable_get(var)
          hash[var[1..-1].to_sym] = (value.class.to_s.include?('Postmen') ? instance_variable_get(var).to_hash : instance_variable_get(var))
        end
      end
      hash
    end

  end
end