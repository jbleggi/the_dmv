# require_relative '../lib/date'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
  end

  def actual_year
    @actual_year = 2024
  end

  def antique?
    actual_year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

end

# @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

# require 'pry'; binding.pry