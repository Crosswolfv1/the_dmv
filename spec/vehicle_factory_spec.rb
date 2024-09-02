require 'spec_helper'


RSpec.describe Vehicle_factory do
  before(:each) do
    @factory = Vehicle_factory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(Vehicle_factory)
    end
  end

  describe '#create vehicle' do
    it 'can create vehicles' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to all(be_an_instance_of(Vehicle))
    end

    it 'can create unique vehicles' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles[0].engine).to eq :ev
      expect(vehicles[1].make).to eq "BMW"
      expect(vehicles[2].model).to eq "Mustang Mach-E"
    end
  end

end
