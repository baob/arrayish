module Arrayish
  class String < ::String

    def initialize(*args)
      if args.respond_to? :each
        super(args.join(separator))
      else
        super
      end
    end

    private

    def separator
      ','
    end

  end
end
