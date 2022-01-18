require 'space'

describe Space do
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name) VALUES ('San Francisco Apartment');")
      spaces = Space.all
      expect(spaces.first.name).to include("San Francisco Apartment")

    end
  end

  describe '.create' do
    it 'returns the dates available for booking' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (date_from, date_to) VALUES ('18-01-22','18-12-22');")
      spaces = Space.all
      expect(spaces.first.date_from).to eq '18-01-22'
      expect(spaces.first.date_to).to eq '18-12-22'
    end
  end 


end