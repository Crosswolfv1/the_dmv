require 'spec_helper'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do

  @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

  registrant_1 = Registrant.new("Bruce", 18, true)
  registrant_2 = Registrant.new("Penny", 16)
  registrant_3 = Registrant.new("Tucker", 15)

  @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
  @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
  @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

    describe '#registered vehicles and collected fees' do
    it 'will start with an empty array of registered vehicles and no collected fees' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#registering a vehicle' do
  it 'will register a vehicle, update the registered vehicles, and update the collected fees' do
    @facility_1.register_vehicle(@cruz)
    expect(@facility_1.registered_vehicles).to eq([@cruz])
    expect(@facility_1.collected_fees).to eq(100)
  end

  it 'will give a registration date' do
    @facility_1.register_vehicle(@cruz)
    expect(@cruz.registration_date).to eq(Date.today)
  end

  it 'can return the plate type' do
    @facility_1.register_vehicle(@cruz)
    expect(@cruz.plate_type).to eq(:regular)
  end
end
  describe '#registering a second and third vehicle' do
  it 'will register a second and third vehicle, update registered vehicles, and upddate collected fees' do
    @facility_1.register_vehicle(@camaro)
    expect(@facility_1.registered_vehicles).to eq([@camaro])
    expect(@camaro.registration_date).to eq(Date.today)

    @facility_1.register_vehicle(@bolt)
    expect(@facility_1.registered_vehicles).to eq([@camaro, @bolt])
    expect(@bolt.registration_date).to eq(Date.today)  
  end

  it 'can return more plate types' do
    @facility_1.register_vehicle(@camaro)
    @camaro.plate_type
    expect(@camaro.plate_type).to eq(:antique)
    
    @facility_1.register_vehicle(@bolt)
    @bolt.plate_type
    expect(@bolt.plate_type).to eq(:ev)
  end

  it 'will accurately calculate the collected fees after regiistering vehicles' do
    @facility_1.register_vehicle(@cruz)
    @facility_1.register_vehicle(@camaro)
    @facility_1.register_vehicle(@bolt)
    expect(@facility_1.collected_fees).to eq(325)
  end
end

  describe '#facility 2 being empty' do
    it 'will return empty/nil/0 values' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end


  describe '#administering a written test' do
  it 'administers a written test' do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 16)
      registrant_3 = Registrant.new("Tucker", 15)
        expect(@facility_1.administer_written_test(registrant_1)).to be false

        @facility_1.add_service('Written Test')

        expect(@facility_1.administer_written_test(registrant_1)).to be true
      end
    end

    describe '#administering a road test' do
    it 'administers a road test' do
      registrant_1 = Registrant.new("Bruce", 18, true)

      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')

      expect(@facility_1.services).to eq(['Written Test', 'Road Test'])
      expect(@facility_1.administer_road_test(registrant_1)).to be true
    end
  end

    describe '#renewing a license' do
    it 'can renew a license' do
      registrant_1 = Registrant.new("Bruce", 18, true)
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')

      expect(@facility_1.services).to eq(['Written Test', 'Road Test', 'Renew License'])
      expect(@facility_1.renew_drivers_license(registrant_1)).to be true
      require 'pry'; binding.pry
    end
  end
end
