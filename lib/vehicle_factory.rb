require_relative '../lib/vehicle'
require_relative '../lib/vehicle_factory'
require_relative '../lib/dmv_data_service'

class VehicleFactory
    attr_accessor :wa_ev_registrations
    # :make, :model, :plate_type, :registration_date, :vin, :year

    def initialize 
    end

    def wa_ev_registrations
        p DmvDataService.new.wa_ev_registrations.first(3)
    end

        # @registrations = {
        #     makes: DmvDataService.new.wa_ev_registrations.first(3).map { |hash| hash.values[4] },
        #     models: DmvDataService.new.wa_ev_registrations.first(3).map { |hash| hash.values[5] },
        #     registration_dates: [],
        #     plate_types: [:ev, :ev, :ev]
        #     vins: DmvDataService.new.wa_ev_registrations.first(3).map { |hash| hash.values[1] },
        #     years: DmvDataService.new.wa_ev_registrations.first(3).map { |hash| hash.values[3] }
        # }

#what i want the data to look like 
        # @registrations = {
        #     make: [],
        #     model: [],
        #     registration_date: [],
        #     vin: [],
        #     year: []
        # }

end
require 'pry'; binding.pry




    # 1. what is pizza_toppings.count
# p pizza_toppings.count
# answer is 3

# 2. what is pizza_toppings.values
# p pizza_toppings.values
# answer: [["green peppers", "jalapeño", "mushrooms"], ["pepperoni", "sausage", "sardines"], ["pineapple"]]

# 3. how can I access the element “pineapple”
# p pizza_toppings[:fruit][0]
# add the index call to pull the individual string from the array-- otherwise you'll get ["pineapple"]

# 4. how can I add the element “olives” to the key “veggies”?
# pizza_toppings[:veggies] << "olives"
# p pizza_toppings[:veggies]