shared_examples 'an arrayish string' do

  it '+ with a string adds the string with a separator' do
    added_string = '1234'
    expect( subject + added_string ).to eql( "#{subject},#{added_string}" )
  end

  specify '[0] operator selects from the array' do
    expect( subject[0] ).to eql( described_class.new( subject.to_a[0] ) )
  end

  specify '[-1] operator selects from the array' do
    expect( subject[-1] ).to eql( described_class.new( subject.to_a[-1] ) )
  end

end
