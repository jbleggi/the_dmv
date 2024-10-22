require_relative '../lib/vehicle'
require_relative '../lib/registrant'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

# to take a hash of attr and assign to instance var
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
      @plate_type = :regular
      @collected_fees += 100

    elsif vehicle.year >= 1999 && vehicle.engine == :ev
      @plate_type = :ev
      @collected_fees += 200

    else
      @plate_type = :antique
      @collected_fees +=25
    end
    
    @registration_date = Time.new
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
    return false unless services.include?('Road Test')
    registrant.license_data[:license] = true
  end

end

registrant_1 = Registrant.new('Bruce', 18, true )
registrant_2 = Registrant.new('Penny', 16 )
registrant_3 = Registrant.new('Tucker', 15 )

facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

# cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
# bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
# camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

facility_1.add_service('Written Test')
registrant_2.earn_permit

require 'pry'; binding.pry