class FacilityFactory
    attr_accessor :co_dmv_facilities, :co_dmv_office_locations, :ny_dmv_office_locations, :ny_dmv_facilities, :mo_dmv_office_locations, :mo_dmv_facilities
    
    def initialize
    end

    def new_co_facility(co_dmv_office_locations)
        @co_dmv_facilities = []

        co_dmv_office_locations.each do |info|
         facility = Facility.new({name: info[:dmv_office], address: info[:address_li], phone: info[:phone], services: info[:services_p]})
        
         @co_dmv_facilities << facility
        end
    end
    
    def new_ny_facility(ny_dmv_office_locations)
        @ny_dmv_facilities = []

        DmvDataService.new.ny_dmv_office_locations.each do |info|
            facility = Facility.new({name: info[:office_name], address: info[:street_address_line1], phone: info[:public_phone_number], services: [] })
            
            @ny_dmv_facilities << facility
        end

    end

    def new_mo_facility(mo_dmv_office_locations)
        @mo_dmv_facilities = []

        DmvDataService.new.mo_dmv_office_locations.each do |info|
            facility = Facility.new({name: info[:name], address: info[:address1], phone: info[:phone], services: [] })
            
            @mo_dmv_facilities << facility
        end

    end

end