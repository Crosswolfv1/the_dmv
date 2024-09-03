require 'spec_helper'


RSpec.describe FacilityFactory do

    before(:each) do
        facilities = FacilityFactory.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        source = DmvDataService.new.co_dmv_office_locations 

        facilities.co_facilities(source)
       
    
    #     end
    # end
end