require_relative '../spec/spec_helper'
require 'rspec'

RSpec.describe VehicleFactory do
    
    it 'creates an array of vehicles' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        factory.create_vehicles(wa_ev_registrations)

        expect(factory.wa_ev_vehicles).to be_an(Array)
    end

    it 'creates an instance of Vehicle with attributes' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        factory.create_vehicles(wa_ev_registrations)
        
        vehicle = factory.wa_ev_vehicles.first

        expect(vehicle).to be_a(Vehicle)
        expect(vehicle.engine).to eq(:ev)
    end
        
end

