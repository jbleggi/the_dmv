class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

# to take a hash of attr and assign to instance var
  def initialize(branch = {})
    @name = branch[:name]
    @address = branch[:address]
    @phone = branch[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = []
  end

  def add_service(service)
    @services << service
  end

  # def register_vehicle(vehicle)
    # @vehicle.registration_date << [@reg_month, @reg_year]
  # end

end
