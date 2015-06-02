require "arrayish/version"
require "arrayish/string"

module Arrayish

  def initialize(*args)
    @this_object = Arrayish::String.new(*args)
  end

  def method_missing(method, *args)
    @this_object.send(method, *args)
  end

  def to_s
    @this_object
  end

end
