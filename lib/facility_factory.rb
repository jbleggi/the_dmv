class FacilityFactory
    attr_reader :co_dmv_facilities, :ny_dmv_office_locations, :mo_dmv_office_locations
    def initialize
    end

    def new_facility(co_dmv_facilities)
        @co_dmv_facilities = []

        DmvDataService.new.co_dmv_office_locations.each do |info|
            facility = Facility.new({name: info[:dmv_office], address: info[:address_li], phone: info[:phone], services: info[:services_p]})
            
            @co_dmv_facilities << facility
        end

    end

end