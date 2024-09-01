
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :permit
  attr_accessor :collected_fees, :registration_date, :plate, :administer_written_test


  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    @services
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit?
      registrant.pass_written_test
      true
    else
      false
    end
  end


  #def plate_type
    #plate
  #end

  def register_vehicle(vehicle)
    #first need to collect fees. 
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
      #depends on vehicle type.
        #vehicles 25+yrs are $25 (antique) - method antique?
        #vehicles ev are $200 - method electric_vehicle?
        #all other vehicles are $100 (regular)

    #add the vehicle to facility registration
    #administer license plate type
    #update registration date
      vehicle.registration_date = Date.today
    # @registered_vehicles << vehicle
    # @collected_fees += plate_type
    # vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
  end


end
