class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees, :engine, :year
  attr_writer :registration_date, :plate_type


  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration") == true
      collect_fee(vehicle)
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    else
      return false
    end
  end

  def collect_fee(vehicle)
    if vehicle.antique? == true
      @collected_fees += 25
      vehicle.plate_type = :antique
    elsif vehicle.engine == :ev
      @collected_fees += 200
      vehicle.plate_type = :ev
    else
      @collected_fees += 100
      vehicle.plate_type = :regular
    end
  end

  def administer_written_test(person)
    if @services.include?('Written Test') == true && person.age >= 16 && person.permit? == true
      person.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(person)
    if @services.include?('Road Test') == true && person.license_data[:written] == true 
      person.license_data[:license] =  true
    else
      false
    end
  end

  def renew_drivers_license(person)
    if @services.include?('Renew License') == true && person.license_data[:license] == true 
      person.license_data[:renewed] = true
    else
      false
    end
  end

end
