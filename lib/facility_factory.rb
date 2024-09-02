require './lib/facility.rb'

class Facility_factory

  def create_facilities(source)
    source.map do |facility_data|
      facility = Facility.new({
        name: facility_data[:dmv_office] || facility_data[:office_name] || facility_data[:name],
        address: address_formatted(facility_data),
        phone: facility_data[:phone] || facility_data[:public_phone_number],
      })
      add_services(facility, facility_data[:services_p])
      
      facility
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

  def add_services(facility, services_string)
    return unless services_string
  
    services = services_string.split(',').map(&:strip)
    services.each do |service|
      facility.add_service(service)
    end
  end
  


end

"vehicle titles, registration, renewals;  VIN inspections"