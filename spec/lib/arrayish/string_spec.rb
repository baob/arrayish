require 'spec_helper'

module Arrayish
  describe String do

    it 'is a kind of string' do
      expect( subject ).to be_kind_of( ::String )
    end

    context 'initialised with a string' do
      let(:a_string) { 'abcde' }
      subject{ described_class.new(a_string) }

      specify 'it equals the string' do
        expect( subject ).to eql(a_string) 
      end

      specify '#to_a returns the string in an array' do
        expect( subject.to_a ).to eql( [a_string] )
      end

      it_behaves_like 'an arrayish string'
    end

    context 'initialised with an array of two strings' do
      let(:a_string) { 'abcde' }
      let(:x_string) { 'xyz' }
      subject{ described_class.new([a_string, x_string]) }

      specify 'it equals the strings joined with separator' do
        expect( subject ).to eql("#{a_string},#{x_string}") 
      end

      specify '#to_a returns the strings in an array' do
        expect( subject.to_a ).to eql( [a_string,x_string] )
      end

      it_behaves_like 'an arrayish string'
    end

  end
end
