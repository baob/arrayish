shared_examples 'an arrayish string' do

  it '+ with a string adds the string with a separator' do
    added_string = '1234'
    expect( subject + added_string ).to eql( "#{subject},#{added_string}" )
  end

  it '+ with an empty string makes no change' do
    added_string = ''
    expect( subject + added_string ).to eql( "#{subject}" )
  end

  it '+ with an array adds the array elements with separators' do
    added_array = [ '1234', '789' ]
    expect( subject + added_array ).to eql( "#{subject},#{added_array[0]},#{added_array[1]}" )
  end

  specify '[0] operator selects from the array' do
    expect( subject[0] ).to eql( described_class.new( subject.to_a[0] ) )
  end

  specify '[-1] operator selects from the array' do
    expect( subject[-1] ).to eql( described_class.new( subject.to_a[-1] ) )
  end

end
