class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :registration_date, :registration_fee, :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @registration_fee = []
    @plate_type = []
  end

  def antique?
    @year <= 1999
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if antique?
      :antique
    elsif electric_vehicle?
      :ev
    else
      :regular
    end
  end

  def registration_fee
    case plate_type
    when :antique
      25
    when :ev
      200
    when :regular
      100
    else
      0
    end
  end

end

cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

# require 'pry'; binding.pry