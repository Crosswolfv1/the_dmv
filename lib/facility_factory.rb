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
    [
      facility[:address_li],
      facility[:street_address_line_1],
      facility[:address1],
      facility[:address__1],
      facility[:city],
      facility[:state],
      facility[:zip],
      facility[:zip_code],
      facility[:zipcode],
    ].compact.join(' ')
  end

end