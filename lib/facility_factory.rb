require './lib/facility.rb'

class Facility_factory

  def create_facilities(source)
    source.map do |facility|
      address_combined = ("#{facility['address_li']}  #{facility['address__1']}  #{facility['city']}  #{facility['state']}  #{facility['zip']}")
      Facility.new({
        name: facility['dmv_office'],
        address: address_combined,
        phone: facility['phone']
      })
    end
  end

end