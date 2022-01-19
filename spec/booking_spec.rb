require 'booking'

  describe Booking do
    
    it 'returns the dates available for booking' do
        connection = PG.connect(dbname: 'makersbnb_test')
        connection.exec("INSERT INTO booking (property_name, stay_date) VALUES ('San Francisco Apartment','18-12-22');")
        booking = Booking.all()
        expect(booking.first.property_name).to eq 'San Francisco Apartment'
        expect(booking.first.stay_date).to eq '18-12-22'
    end



# describe '.create' do
#   it 'Creates one day booking' do

#     #connection = PG.connect(dbname: 'makersbnb_test')
#     #

#     booking = Booking.new(property_name: 'San Francisco Apartment', stay_date: '01/02/2022')
#     persisted_data = persisted_data(booking_id: booking.booking_id)
#     expect(booking).to be_a Booking
#     # expect(booking.length).to eq 1
#     expect(booking.first.property_name) == 'San Francisco Apartment'
#     expect(booking.first.stay_date) == '01/02/2022'
#   end
# end
end 


