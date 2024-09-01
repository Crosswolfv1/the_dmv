class Registrant
attr_reader :name,
            :age,
            :permit,
            :license_data

    def initialize(name, age, permit=false)    
        @name = name
        @age = age
        @permit = permit
        @license_data = {
            written: false,
            license: false,
            renewed: false
          }
    end

    def permit?
        @permit
    end

    def earn_permit
       if @permit = @age > 15
        true
        @license_data[:written] = true
       else
        false
       end
    end

    def administer_road_test
        if earn_permit
          @license_data[:license] = true
        else
          false
        end
      end

    def renew_drivers_license
        if administer_road_test
            @license_data[:renewed] = true
        else
            false
        end
    end

    #Written Test

    # def pass_written_test
    #     if earn_permit = true
    #     @license_data[:written] = true
    #   end
    # end
end