require 'spec_helper'
require './lib/registrant'
require './lib/facility'

    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 16)
    registrant_3 = Registrant.new("Tucker", 15)

RSpec.describe Registrant do
    before(:each) do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 16)
    registrant_3 = Registrant.new("Tucker", 15)

    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

    it 'exists' do
    registrant_1 = Registrant.new("Bruce", 18, true)
    
    expect(registrant_1).to be_instance_of(Registrant)
    end

    it 'can give registrant information' do
    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.name).to eq("Penny")

    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(16)
    end
    #require 'pry'; binding.pry

    it 'can give permit information' do
        expect(registrant_1.permit?).to eq(true)
        expect(registrant_2.permit?).to eq(false)
    end

    it 'can give license data' do
        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can have a registrant earn a permit' do
        registrant_2.earn_permit
         expect(registrant_2.permit?).to eq(true)
    end

    describe '#getting a written test' do
    it 'can update license data' do
        expect(registrant_2.permit?).to eq(false)
        require 'pry'; binding.pry
        expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(registrant_2.earn_permit).to eq(true)
        expect(registrant_2.permit?).to eq(true)
        expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    end
    #require 'pry'; binding.pry
end