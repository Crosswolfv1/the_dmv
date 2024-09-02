require './lib/facility.rb'

class Facility_factory

  def create_facilities(source)
    source.map do |facility|
      Facility.new({
        name: facility[:dmv_office] || facility[:office_name] || facility[:name],
        address: address_formatted(facility),
        phone: facility[:phone] || facility[:public_phone_number]
      })
    end
  end

  def address_formatted(facility)
    key_map = {
      address_line_1: [:address_li, :street_address_line_1, :address1],
      address_line_2: [:address__1, :street_address_line_2],
      city: [:city],
      state: [:state],
      zip: [:zip, :zip_code, :zipcode]
    }
    address_parts = key_map.map do |_, keys|
      keys.find { |key| facility[key] }
    end.map { |key| facility[key] }
    address_parts.compact.join(' ')
  end
end