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

end