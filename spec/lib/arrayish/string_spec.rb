require 'spec_helper'

module Arrayish
  describe String do

    it 'is a kind of string' do
      expect( subject ).to be_kind_of( ::String )
    end
  end
end
