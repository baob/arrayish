require 'spec_helper'

module Arrayish
  describe String do
    let(:a_string) { 'abcde' }
    let(:x_string) { 'xyz' }
    subject{ described_class.new(init_params) }

    it 'is a kind of string' do
      expect( described_class.new ).to be_kind_of( ::String )
    end

    context 'initialised with a string' do
      let(:init_params) { a_string }

      it_behaves_like 'the initialization parameter'
      it_behaves_like 'an arrayish string'
      it_behaves_like 'unchanged object when adding nothing'
    end

    context 'initialised with an empty string' do
      let(:init_params) { '' }

      it_behaves_like 'a nil arrayish string'
      it_behaves_like 'unchanged object when adding nothing'
    end

    context 'initialised with nil' do
      let(:init_params) { nil }

      it_behaves_like 'a nil arrayish string'
      it_behaves_like 'unchanged object when adding nothing'
    end

    context 'initialised with an array of two strings' do
      let(:init_params) { [a_string, x_string] }

      it_behaves_like 'the initialization parameters'
      it_behaves_like 'an arrayish string'
      it_behaves_like 'unchanged object when adding nothing'
    end

  end
end
