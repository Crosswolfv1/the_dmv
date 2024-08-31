require 'spec_helper'
require './lib/registrant'

    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

RSpec.describe Registrant do
    before(:each) do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)
    end

    it 'exists' do

    registrant_1 = Registrant.new("Bruce", 18, true)
    
    expect(registrant_1).to be_instance_of(Registrant)
    end

    it 'can give registrant information' do

    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.name).to eq("Penny")

    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(15)
    end
    require 'pry'; binding.pry

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
end