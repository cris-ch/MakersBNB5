require 'pg'

class Booking

  attr_reader :booking_id, :property_name, :stay_date

    def initialize(booking_id:, property_name:, stay_date:)
      @booking_id = booking_id
      @property_name = property_name
      @stay_date = stay_date
    end

    def self.all()
        if ENV['RACK_ENV'] == 'test'
            con = PG.connect :dbname => 'makersbnb_test'
        else
            con = PG.connect :dbname => 'makersbnb'
        end

        result = con.exec("SELECT * FROM booking")
        result.map do |booking|
          Booking.new(booking_id: booking['booking_id'], property_name: booking['property_name'], stay_date: booking['stay_date'])
        end
    end 

    def self.create(property_name:, stay_date:)
        if ENV['RACK_ENV'] == 'test'
            con = PG.connect :dbname => 'makersbnb_test'
        else
            con = PG.connect :dbname => 'makersbnb'
        end

        result = con.exec("INSERT INTO booking (property_name, stay_date) VALUES('#{property_name}','#{stay_date}',)")
        Booking.new(booking_id: result[0]['booking_id'], property_name: result[0]['property_name'], stay_date: result[0]['stay_date'])
    end 
end
