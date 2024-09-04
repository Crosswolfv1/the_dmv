require 'spec_helper'


RSpec.describe FacilityFactory do
    before(:each) do
        @facilities = FacilityFactory.new
        DmvDataService.new.co_dmv_office_locations
        @co_source = DmvDataService.new.co_dmv_office_locations 
        @ny_source = DmvDataService.new.ny_dmv_office_locations
        @mis_source = DmvDataService.new.mo_dmv_office_locations
    end  

    describe '#colorado location attributes' do
    it 'can count the number of locations in the array' do
       
        expect(@facilities.co_facilities(@co_source).count).to eq(5)
    end

   it 'can give the name of the last location' do

        expect(@facilities.co_facilities(@co_source).last.name).to eq("DMV Southeast Branch")
    end

    it 'can give the phone number of the 1st index of the array' do

        expect(@facilities.co_facilities(@co_source)[1].phone).to eq("(720) 865-4600")
    end

    it 'can give the address of the 4th index of the array' do

        expect(@facilities.co_facilities(@co_source)[4].address).to eq("2243 S Monaco Street Pkwy, , Denver, CO 80222")
    end

    it 'can give the name of the location in the 3rd index of the array' do

        expect(@facilities.co_facilities(@co_source)[0].name).to eq("DMV Tremont Branch")
    end
end

    describe '#ny location attributes' do
    it 'can give the name of index 0 in the array' do

        expect(@facilities.ny_facilities(@ny_source)[0].name).to eq("HUDSON")
    end

    it 'can give the phone number of the last location' do

        expect(@facilities.ny_facilities(@ny_source).last.phone).to eq("7189666155")
    end

    it 'can give the address of the location in index 5 in the array' do

        expect(@facilities.ny_facilities(@ny_source)[5].address).to eq("1 LARKIN PLAZA, YONKERS, NY 10701")
    end

    it 'can count the number of locations in the array' do

        expect(@facilities.ny_facilities(@ny_source).count).to eq(172)
    end
    it 'can give the name of the location in index 99 in the array' do

        expect(@facilities.ny_facilities(@ny_source)[99].name).to eq("DELHI")
    end
end

    describe '#mis location attributes' do
    it 'can count the number of locations in the array' do

        expect(@facilities.mis_facilities(@mis_source).count).to eq(178)
    end

    it 'can give the name of the location in index 13' do

        expect(@facilities.mis_facilities(@mis_source)[13].name).to eq("NEVADA")
    end

    it 'can give the phone number of the last location' do

        expect(@facilities.mis_facilities(@mis_source).last.phone).to eq("(636) 629-6000")
    end

    it 'can give the address of the location in index 66' do

        expect(@facilities.mis_facilities(@mis_source)[66].address).to eq("2000 ROCK ROAD, DE SOTO, MO 63020")
    end

    it 'can give the name of the location in index 124' do
        
        expect(@facilities.mis_facilities(@mis_source)[124].name).to eq("BUFFALO")
    end
end
end
