# Arrayish

The gem introduces the Arrayish::String class, a string that has
some array characteristics.

Arrayish::String simplifies and DRYs code where an array appears in a
string with delimiters.

[![Travis Build
Status](https://travis-ci.org/baob/arrayish.svg?branch=master)](https://travis-ci.org/baob/testing-in-nodejs)

[![Code
Climate](https://codeclimate.com/github/baob/arrayish/badges/gpa.svg)](https://codeclimate.com/github/baob/arrayish)

[![Dependency Status][DS img]][Dependency Status]

[Dependency Status]: https://gemnasium.com/baob/arrayish
[DS img]: https://gemnasium.com/baob/arrayish.png

## Examples of Use

Where what is effectively array data is supplied as a string with separators,
this can simplify code. Example

    > fruits = Arrayish::String.new('apples,pears,oranges')

    > fruits[1..-1]
    => "pears,oranges"

Contrast the same thing with an ordinary string

    > fruits = 'apples,pears,oranges'

    > fruits.split(',')[1..-1].join(',')
    => "pears,oranges"

The gem was written after enountering code that with littered with lines
like the above, with repeated splits and joins. The meaning of the code
was obfuscated by the chained transformations.

An Arrayish::String can be cast to an array or string as required.

    > fruits.to_s[0..4]
    => "apple"

    > fruits.to_a
    => ["apples", "pears", "oranges"]

## Installation

Add this line to your application's Gemfile:

    gem 'arrayish'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arrayish

## Usage

### Use the class directly

The separator will be a comma.

    > fruits = Arrayish::String.new('apples,pears,oranges')

### Subclass it

    > require 'arrayish'
    > class FruitList < Arrayish::String
    >   def separator
    >     '|'
    >   end
    > end

    > fruits = FruitList.new('apples|pears')
    => "apples|pears"
    > fruits[0]
    => "apples"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
