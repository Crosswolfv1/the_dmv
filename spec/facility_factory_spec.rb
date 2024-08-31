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
      dmvs = @facility_factory.create_facilities(@colorado_facilities)
      expect(dmvs).to all(be_an_instance_of(Facility))
    end
  end

end