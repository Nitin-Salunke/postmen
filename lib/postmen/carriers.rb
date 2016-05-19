module Postmen
  module Carriers
    extend self

    attr_reader :registered
    @registered = []

    def register(class_name, autoload_require)
      Postmen.autoload(class_name, autoload_require)
      self.registered << class_name
    end

    def all
      Postmen::Carriers.registered.map { |name| Postmen.const_get(name) }
    end

    def find(name)
      all.find { |c| c.name.downcase == name.to_s.downcase } or raise NameError, "unknown carrier #{name}"
    end
  end
end

Postmen::Carriers.register :Fedex, 'postmen/carriers/fedex'
