class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :registration_date, :registration_fee, :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = []
    @registration_fee = []
    @plate_type = []
  end

  def register_vehicle(vehicle)
    @registration_date << [@reg_month, @reg_year]
  end

  def antique?
    @year <= 1999
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if @antique? == true
      @plate_type << [:antique]
    elsif @electric_vehicle? == true
      @plate_type << [:ev]
    else
      @plate_type << [:regular]
    end
  end

  # def registration_fee
  #   if @antique? == true
  #     @registration_fee << $25
  #   elsif electric_vehicle? == true
  #     @registration_fee << $200
  #   else
  #     @registration_fee << $100
  #   end
  # end

end

cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

# require 'pry'; binding.pry