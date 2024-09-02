require './lib/dmv_data_service'
require './lib/vehicle_factory'
require './lib/vehicle'


factory = VehicleFactory.new

RSpec.describe VehicleFactory do
describe 'getting information' do
    it 'holds an array' do

    vehicles = VehicleFactory.new
 
    expect(vehicles).to be_an_instance_of(VehicleFactory)
    require 'pry'; binding.pry
    end
  end
end