require './lib/dmv_data_service'
require './lib/vehicle_factory'
require './lib/vehicle'


factory = VehicleFactory.new

RSpec.describe VehicleFactory do
 it 'is an instance of the vehicle factory' do

    vehicles = VehicleFactory.new
 
    expect(vehicles).to be_an_instance_of(VehicleFactory)
    #require 'pry'; binding.pry
  end
  it 'creates new vehicles based from an external data set' do
    vehicles = VehicleFactory.new
    source = DmvDataService.new.wa_ev_registrations

    vehicle.create_vehicles(source)

    expect(vehicle.create_vehicles(source)).to eq
  end
end

