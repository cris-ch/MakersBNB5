require 'booking'

describe Booking do
    it 'should respond to #booking_request' do 
        expect(subject).to respond_to(:booking_request)
    end 
end 