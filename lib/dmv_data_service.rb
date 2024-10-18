require 'faraday'
require 'json'
#each class method from DMV data service will give us dynamic data
#data will come back as a giant array
#will call class methods on dmv data service
#will return giant array
#ENUMERATE through array
#create class objects through every element of this array
#will create new facilities based on this information
#there will be more data than you need
#pick pieces of data that we are going to need based on iteration pattern
#our job is to organize the data 
#call the dmv data serve on our methods
#for each loop, map
#with your map, you are going to be assigning data to a new instance of a class you have alaready built
#won't need to change data-- iterate over data
class DmvDataService
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wa_ev_registrations
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json')
  end

  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data('https://data.colorado.gov/resource/dsw3-mrn4.json')
  end

  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')
  end

  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')
  end
end
