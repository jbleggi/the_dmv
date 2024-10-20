# require_relative '../lib/date'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = []
  end

  def registration_date
    @reg_year = 2024
    @reg_month = 10
  end

  def register_vehicle(vehicle)
    @registration_date << [@reg_month, @reg_year]
  end

  def antique?
    @reg_year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

end

require 'pry'; binding.pry