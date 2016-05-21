module Postmen
  class Dimension
    include Postmen::Common

    attr_reader :width,
                :height,
                :depth,
                :unit

    def initialize(options)
      @width = options[:width]
      @height = options[:height]
      @depth = options[:depth]
      @unit = options[:unit]
    end
  end
end