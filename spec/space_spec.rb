require 'space'
require 'database_helper'

describe Space do
  
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')

      connection.exec("INSERT INTO spaces (name, short_description, price) VALUES ('San Francisco Apartment', 'Nice apartment', '100');")
      connection.exec("INSERT INTO spaces (name, short_description, price) VALUES ('London House', 'Beatiful house', '150');")
      
      spaces = Space.all

      expect(spaces.length).to eq 2
      expect(spaces.first.name).to include("San Francisco Apartment")
      expect(spaces.first.short_description).to include("Nice apartment")
      expect(spaces.first.price).to include("100")
    end
  end

  describe '.create' do
    it 'adds a new space' do

      test_space = Space.create(name: 'London House', short_description: 'Beautiful House', price: '150')
      result = Space.all
      #data = persisted_data(id: test_space.id)
      #expect(test_space.id).to eq persisted_data[id]
      expect(result.first.name).to eq 'London House'
      expect(result.first.short_description).to eq 'Beautiful House'  
      expect(result.first.price).to eq '$150.00'  
    end
  end
end