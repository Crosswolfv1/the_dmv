class FacilityFactory

    
    

    def co_facilities(source)
        facilities = []
        source.each do |data|
            address = "#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
           facility = Facility.new({
                :name => data[:dmv_office],
                :address => address,
                :phone => data[:phone],
                :services => data[:services_p]
            })
        facilities << facility
        end 
        facilities
    end


    def ny_facilities(source)
        facilities = []
        source.each do |data|
            address = "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}"
           facility = Facility.new({
                :name => data[:office_name],
                :address => address,
                :phone => data[:public_phone_number]
            })
        facilities << facility
        end 
        facilities
    end

    def ny_facilities(source)
        facilities = []
        source.each do |data|
            address = "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}"
           facility = Facility.new({
                :name => data[:office_name],
                :address => address,
                :phone => data[:public_phone_number]
            })
        facilities << facility
        end 
        facilities
    end

    
end