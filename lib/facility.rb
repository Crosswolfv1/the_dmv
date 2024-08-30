class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  attr_writer :registration_date


  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration") == true
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    else
      return 'This facility cannot register vehicles'
    end
  end
end
