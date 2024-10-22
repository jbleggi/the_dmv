class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :registration_date, :registration_fee, :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = []
  end

  def antique?
    @year <= 1999
  end

  def electric_vehicle?
    @engine == :ev
  end

end
