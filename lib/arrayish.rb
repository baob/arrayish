require "arrayish/version"
require "arrayish/string"

module Arrayish

  def initialize(*args)
    @this_object = Arrayish::String.new(*args)
  end

  def method_missing(method, *args)
    @this_object.send(method, *args)
  end

  def +(arg)
    return self if arg.nil? || arg == ''
    return new_string(arg) if self.to_s.size == 0
    new_string(@this_object + arg)
  end

  def to_s
    @this_object
  end

  def new_string(something)
    self.class.new(something)
  end

end
