class VehicleFactory
    

 

    def create_vehicles(source)
        vehicles = []
        source.each do |data|
           vehicle = Vehicle.new({
                :vin => data[:vin_1_10],
                :make => data[:make],
                :model => data[:model],
                :year => data[:model_year].to_i,
                :engine => :ev
            })
        vehicles << vehicle
        end 
        vehicles
    end

end



