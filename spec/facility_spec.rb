require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#collect fees' do
    it 'can collect fees' do
      @facility.collect_fee(@cruz)
      expect(@facility.collected_fees).to eq(100)
    end

    it 'can collect fees multiple times' do
      @facility.collect_fee(@cruz)
      expect(@facility.collected_fees).to eq(100)
      @facility.collect_fee(@camaro)
      expect(@facility.collected_fees).to eq(125)
      @facility.collect_fee(@bolt)
      expect(@facility.collected_fees).to eq(325)
    end
  end

  describe '#register vehicle' do
    it 'can register a vehicle' do
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
      expect(@facility.registered_vehicles.count).to eq(1)
      @facility.register_vehicle(@bolt)
      expect(@bolt.registration_date).to be_an_instance_of(Date)
      @facility.register_vehicle(@camaro)
      expect(@camaro.registration_date).to be_an_instance_of(Date)
      expect(@facility.registered_vehicles.count).to eq(3)
    end

    it 'can fail to register a vehicle' do
      expect(@facility.register_vehicle(@cruz)).to eq false
    end

    it 'sets a plate type' do
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
      @facility.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
      @facility.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)

    end
  end

  describe '#administer written test' do
    it 'can give a written a test' do
      @facility.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to eq false
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to eq true
    end

    it 'can differentiate based on age' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data[:written]).to eq false
    end

    it 'can differentiate based on permit?' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to eq false
      @registrant_2.earn_permit
      @facility.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to eq true
    end
  end

  describe '#administer road test' do
    it 'can give a road test' do
      @facility.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq false
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      @facility.add_service('Road Test')
      @facility.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq true
    end
  end

  describe '#renew drivers license'do
    it 'can renew license' do
      @facility.renew_drivers_license(@registrant_1)
      expect(@registrant_1.license_data[:renewed]).to eq false
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      @facility.add_service('Road Test')
      @facility.administer_road_test(@registrant_1)
      @facility.add_service('Renew License')
      @facility.renew_drivers_license(@registrant_1)
      expect(@registrant_1.license_data[:renewed]).to eq true
    end
  end

end
