require './lib/vehicle'

class Vehicle_factory

  def create_vehicles(source)
    source.map do |vehicle| 
      engine_type = if vehicle["fuel_type"] == "ELECTRIC" || vehicle["electric_vehicle_type"] == "Battery Electric Vehicle (BEV)"
                      :ev
                    else 
                      :ice
                    end
      Vehicle.new({
        vin: vehicle["vin_1_10"] || vehicle["vin"],
        year: vehicle["model_year"].to_i,
        make: vehicle["make"],
        model: vehicle["model"] || vehicle["body_type"],
        engine: engine_type
      })
    end
  end
end