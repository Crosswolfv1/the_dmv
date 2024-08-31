require './lib/facility.rb'

class Facility_factory

  def create_dmvs(source)
    source.map do |facility|
      address_combined = (facility['address_li'] + ' ' + facility['address__1'] + ' ' + facility['city'] + ' ' + facility['state'] + ' ' + facility['zip']).to_s
      Facility.new({
        name: facility['dmv_office'],
        address: address_combined,
        phone: facility['phone']
      })
    end
    
  end

end