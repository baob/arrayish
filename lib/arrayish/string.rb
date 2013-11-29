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

    private

    def separator
      ','
    end

  end
end
