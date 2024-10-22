require_relative '../spec/spec_helper'
require_relative '../lib/dmv_data_service.rb'
require_relative '../lib/vehicle.rb'
require 'pry'

class VehicleFactory
    attr_reader :wa_ev_registrations, :wa_ev_vehicles

    def initialize
    end

    def create_vehicles(wa_ev_registrations)
        @wa_ev_vehicles = []

        wa_ev_registrations.each do |registration|
            vehicle = Vehicle.new({vin: registration[:vin_1_10], year: registration[:model_year], make: registration[:make], model: registration[:model], engine: :ev})         
     
            @wa_ev_vehicles << vehicle
        end

    end

end