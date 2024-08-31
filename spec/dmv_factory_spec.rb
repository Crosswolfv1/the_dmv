require './spec/spec_helper'

RSpec.describe Dmv_factory do
  before(:each) do
    @dmv_factory = Dmv_factory.new
    @colorado_facilities = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv_factory).to be_an_instance_of(Dmv_factory)
    end       
  end

  describe '#create dmv' do
    it 'can create dmvs' do
      dmvs = @dmv_factory.create_dmv(@colorado_facilities)
      expect(dmvs).to all(be_an_instance_of(Dmv))
    end
  end
end