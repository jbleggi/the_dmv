class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(branch = {})
    @name = branch[:name]
    @address = branch[:address]
    @phone = branch[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil unless services.include?('Vehicle Registration')

    if vehicle.year >= 1999 && vehicle.engine == :ice
      vehicle.plate_type << :regular
      @collected_fees += 100

    elsif vehicle.year >= 1999 && vehicle.engine == :ev
      vehicle.plate_type << :ev
      @collected_fees += 200

    else
      vehicle.plate_type << :antique
      @collected_fees +=25
    end
    
    # vehicle.registration_date = Time.new

    @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    if registrant.permit? == true && services.include?('Written Test') && registrant.age >= 16
    registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true && registrant.permit? == true && services.include?('Road Test')
    registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if registrant.license_data[:written] == true && registrant.license_data[:license] == true && services.include?('Renew License')
      registrant.license_data[:renewed] = true
    else
      false
    end
  end

end