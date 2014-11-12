module Arrayish
  class String < ::String

    def initialize(*args)
      if args.respond_to? :each
        super(args.join(separator))
      else
        super
      end
    end

    def to_a
      self.split(separator)
    end

    def +(something)
      new_string( self.to_a + coerce_to_array(something) )
    end

    def [](*args)
      new_string( self.to_a.send(:[],*args) )
    end

    private

    def separator
      ','
    end

    def coerce_to_array(input)
      return [] if input.empty?
      [input]
    end

    def new_string(something)
      self.class.new(something)
    end

  end
end
