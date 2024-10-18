class Facility
  attr_reader :name, :address, :phone, :services
# to take a hash of attr and assign to instance var
  def initialize(branch = {})
    @name = branch[:name]
    @address = branch[:address]
    @phone = branch[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
