require_relative '../spec/spec_helper'
require 'rspec'

RSpec.describe FacilityFactory do
    
    it 'can create an array of facilities' do
        factory = FacilityFactory.new
        co_dmv_facilities = DmvDataService.new.co_dmv_office_locations
        factory.new_facility(co_dmv_facilities)

        expect(factory.co_dmv_facilities).to be_an(Array)
    end

    it 'can create an instance of a Facility with attributes' do
        factory = FacilityFactory.new
        co_dmv_facilities = DmvDataService.new.co_dmv_office_locations
        factory.new_facility(co_dmv_facilities)

        facility = factory.co_dmv_facilities.first

        expect(facility).to be_a(Facility)
        
        expect(facility.name).to eq('DMV Tremont Branch')
        expect(facility.address).to eq('2855 Tremont Place')
        expect(facility.phone).to eq('(720) 865-4600')
    end

end