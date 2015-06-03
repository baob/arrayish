shared_examples 'an arrayish string' do

  context '+ with a string' do
    let (:added_string) { '1234' }
    let(:result) { subject + added_string }

    it 'adds the string with a separator' do
      expect( result.to_s ).to eql( "#{subject},#{added_string}" )
    end

    specify { expect(result).to be_an_instance_of(described_class) }
  end

  context '+ with an array' do
    let (:added_array) { [ '1234', '789' ] }
    let(:result) { subject + added_array }

    it 'adds the array elements with separators' do
      expect( result.to_s ).to eql( "#{subject},#{added_array[0]},#{added_array[1]}" )
    end

    specify { expect(result).to be_an_instance_of(described_class) }
  end

  specify '[0] operator selects from the array' do
    expect( subject[0] ).to eql( subject.to_a[0] )
  end

  specify '[-1] operator selects from the array' do
    expect( subject[-1] ).to eql( subject.to_a[-1] )
  end

end

shared_examples 'a nil arrayish string' do

  specify '#to_a returns an empty array' do
    expect( subject.to_a ).to eql( [] )
  end

  context '+ with a string' do
    let (:added_string) { '1234' }
    let(:result) { subject + added_string }

    it 'gives the added string' do
      expect( result.to_s ).to eql( "#{added_string}" )
    end

    specify { expect(result).to be_an_instance_of(described_class) }
  end

  context '+ with an array' do
    let (:added_array) { [ '1234', '789' ] }
    let(:result) { subject + added_array }

    it 'gives the array elements with separators' do
      expect( result.to_s ).to eql( "#{added_array[0]},#{added_array[1]}" )
    end

    specify { expect(result).to be_an_instance_of(described_class) }
  end

end

shared_examples 'an empty string' do

  specify 'it equals an empty string' do
    expect( subject.to_s ).to eql('')
  end

  specify { expect(subject).to be_an_instance_of(described_class) }

end

shared_examples 'unchanged object when adding nothing' do

  it '+ with an empty string makes no change' do
    added_string = ''
    expect( subject + added_string ).to eql( subject )
  end

  it '+ with nil makes no change' do
    added_string = nil
    expect( subject + added_string ).to eql( subject )
  end

end
