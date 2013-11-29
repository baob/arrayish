shared_examples 'an arrayish string' do

  it '+ with a string adds the string with a separator' do
    added_string = '1234'
    expect( subject + added_string ).to eql( "#{subject},#{added_string}" )
  end

end
