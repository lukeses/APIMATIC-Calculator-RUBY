# Extracted from Remote API gem (https://github.com/cstrahan/rapi).

module ApimaticCalculator
  class BaseStringEnum

    private
    def self.enum_attr(name, val)
      name = name.to_s

      define_method(name + '?') do
        @attrs == val
      end
    end

    public
    def initialize(attrs = '')
      @attrs = attrs
    end

    def to_s
      @attrs
    end

  end
end