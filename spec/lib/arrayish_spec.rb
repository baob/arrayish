require 'spec_helper'

unless defined?(ClassIncludingArrayish)
  ClassIncludingArrayish ||= Class.new do
    include Arrayish
  end
end

describe ClassIncludingArrayish do

  let(:a_string) { 'abcde' }
  let(:x_string) { 'xyz' }

  context 'initialised with a string' do
    let(:instance) { described_class.new(a_string) }
    subject{ instance }

    describe 'when cast as a string' do
      subject{ instance.to_s }

      specify 'it equals the string' do
        expect( subject ).to eql(a_string)
      end
    end

    specify '#to_a returns the string in an array' do
      expect( subject.to_a ).to eql( [a_string] )
    end

    it_behaves_like 'an arrayish string'
    it_behaves_like 'unchanged object when adding something insignificant'
  end

  context 'initialised with an empty string' do
    let(:a_string) { '' }
    let(:instance) { described_class.new(a_string) }
    subject{ instance }

    describe 'when cast as a string' do
      subject{ instance.to_s }

      it_behaves_like 'an empty string'
    end

    it_behaves_like 'a nil arrayish string'
    it_behaves_like 'unchanged object when adding something insignificant'
  end

  context 'initialised with nil' do
    let(:a_string) { nil }
    let(:instance) { described_class.new(a_string) }
    subject{ instance }

    describe 'when cast as a string' do
      subject{ instance.to_s }

      it_behaves_like 'an empty string'
    end

    it_behaves_like 'a nil arrayish string'
    it_behaves_like 'unchanged object when adding something insignificant'
  end

  context 'initialised with an array of two strings' do
    let(:instance) { described_class.new([a_string, x_string]) }
    subject{ instance }


    describe 'when cast as a string' do
      subject{ instance.to_s }

      specify 'it equals the strings joined with separator' do
        expect( subject ).to eql("#{a_string},#{x_string}")
      end
    end

    specify '#to_a returns the strings in an array' do
      expect( subject.to_a ).to eql( [a_string,x_string] )
    end

    it_behaves_like 'an arrayish string'
    it_behaves_like 'unchanged object when adding something insignificant'
  end

end
