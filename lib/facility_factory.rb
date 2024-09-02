class FacilityFactory

    def initialize
    end

    def create_facilities(source)
        facilities = []
        source.each do |data|
        facilities << create_facility(data)
        end 
        facilities 
    end
    
     def create_facility(data)
        Facility.new(data)
    end
end