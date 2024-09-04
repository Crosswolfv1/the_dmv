require './lib/dmv_data_service'
require './lib/vehicle_factory'
require './lib/vehicle'


factory = VehicleFactory.new

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @vehicles = VehicleFactory.new 
        @source = DmvDataService.new.wa_ev_registrations
    end
    it 'is has vehicles as an instance of the vehicle factory' do 

        expect(@vehicles).to be_an_instance_of(VehicleFactory)
    end

    it 'can count the number of vehicles' do

        expect(@vehicles.create_vehicles(@source).count).to eq(1000)
    end

    it 'can will return an array of vehicles' do

        expect(@vehicles.create_vehicles(@source)).to be_an(Array)
    end

    it 'can give the make of the first vehicle' do

        expect(@vehicles.create_vehicles(@source).first.make).to eq("TESLA")
    end

    it 'can give the make and the model of the vehicle in index 45' do

        expect(@vehicles.create_vehicles(@source)[45].model).to eq("X3")
        expect(@vehicles.create_vehicles(@source)[45].make).to eq("BMW")
    end

    it 'can give the year of the last vehicle' do
        
        expect(@vehicles.create_vehicles(@source).last.year).to eq(2015)
    end
end


