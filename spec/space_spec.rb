require 'space'

describe Space do
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')

      connection.exec("INSERT INTO spaces (name) VALUES ('San Francisco Apartment');")
      connection.exec("INSERT INTO spaces (name) VALUES ('London House');")
      
      spaces = Space.all

      expect(spaces).to include("San Francisco Apartment")
      expect(spaces).to include("London House")
    end
  end

end