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

    specify 'it equals the string' do
      expect( subject.to_s ).to eql(a_string)
    end

    specify { expect(subject).to be_an_instance_of(described_class) }

    specify '#to_a returns the string in an array' do
      expect( subject.to_a ).to eql( [a_string] )
    end

    it_behaves_like 'an arrayish string'
    it_behaves_like 'unchanged object when adding nothing'
  end

  context 'initialised with an empty string' do
    let(:a_string) { '' }
    let(:instance) { described_class.new(a_string) }
    subject{ instance }

    it_behaves_like 'an empty string'
    it_behaves_like 'a nil arrayish string'
    it_behaves_like 'unchanged object when adding nothing'
  end

  context 'initialised with nil' do
    let(:a_string) { nil }
    let(:instance) { described_class.new(a_string) }
    subject{ instance }

    it_behaves_like 'an empty string'
    it_behaves_like 'a nil arrayish string'
    it_behaves_like 'unchanged object when adding nothing'
  end

  context 'initialised with an array of two strings' do
    let(:instance) { described_class.new([a_string, x_string]) }
    subject{ instance }

    specify 'it equals the strings joined with separator' do
      expect( subject.to_s ).to eql("#{a_string},#{x_string}")
    end

    specify { expect(subject).to be_an_instance_of(described_class) }

    specify '#to_a returns the strings in an array' do
      expect( subject.to_a ).to eql( [a_string,x_string] )
    end

    it_behaves_like 'an arrayish string'
    it_behaves_like 'unchanged object when adding nothing'
  end

end
