require 'spec_helper'

describe 'external request' do
  it 'queries BoredAPI' do
    uri = URI('https://www.boredapi.com/api/activity')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end