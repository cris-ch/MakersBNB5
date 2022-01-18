require 'pg'

class Space

  attr_reader :id, :name, :short_description, :price

  def initialize(id:, name:, short_description:, price:)
    @id = id
    @name = name
    @short_description = short_description
    @price = price
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end
    result = con.exec "SELECT * FROM spaces"
    result.map { |space| space = Space.new(id: space['id'], 
      name: space['name'], short_description: space['short_description'],
      price: space['price'])
    }
  end 

  def self.create(name:, short_description:, price:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end
    #Next code is not working
    #return false if (name.to_s.empty?)
    #|| short_description.to_s.empty? || price.to_s.empty?)
    con.exec("INSERT INTO spaces (name, short_description, price) VALUES('#{name}', '#{short_description}', '#{price}')")
  end
end