class Dmv
attr_reader :dmv, :facilities

  def initialize(facility = {})
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all { |facility| facility.services.include?(service) }
  end
  
end