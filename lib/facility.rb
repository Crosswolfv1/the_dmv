
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :permit
  attr_accessor :collected_fees, :registration_date, :plate, :data
                


  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @data = data
  end

  def add_service(service)
    @services << service
    @services
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit?
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.age >15
      true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.administer_road_test
      true
    else
      false
    end
  end

  def register_vehicle(vehicle)
      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.plate_type = :ev
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
   
      vehicle.registration_date = Date.today
  
      @registered_vehicles << vehicle
  end
end
