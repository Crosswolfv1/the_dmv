require './spec/spec_helper'

RSpec.describe Facility_factory do
  before(:each) do
    @facility_factory = Facility_factory.new
    @colorado_facilities = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_factory).to be_an_instance_of(Facility_factory)
    end       
  end

  describe '#create dmvs' do
    it 'can create dmvs' do
      facilities = @facility_factory.create_facilities(@colorado_facilities)
      expect(facilities).to all(be_an_instance_of(Facility))
      expect(facilities[0].name).to eq("DMV Tremont Branch")
      expect(facilities[1].address).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
      expect(facilities[2].phone).to eq("(720) 865-4600")
    end

    it 'can create dmvs from multiple data sources' do
      facilities1 = @facility_factory.create_facilities(@new_york_facilities)
      expect(facilities1[0].name).to eq(@new_york_facilities[0][:office_name])
      expect(facilities1[1].address).to eq("200 E. MAIN STREET STE. 101 ROCHESTER NY 14604")
      expect(facilities1[2].phone).to eq(@new_york_facilities[2][:public_phone_number])
      
      facilities2 = @facility_factory.create_facilities(@missouri_facilities)
      expect(facilities2[0].name).to eq("OAKVILLE")
      expect(facilities2[1].address).to eq("311 S Main Street NEW LONDON MO 63459")
      expect(facilities2[2].phone).to eq(nil)
    end
  end

end