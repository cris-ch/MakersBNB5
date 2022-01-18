require 'pg'

class Space
  attr_reader :name, :date_from, :date_to

  def initialize(name:, date_from:, date_to:)
    @name = name
    @date_from = date_from
    @date_to = date_to
  end

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

    result.map do |space|
      Space.new(name: space['name'], date_from: space['date_from'], date_to: space['date_to'], id: space['id'], short_description: space['short_description'],
      price: space['price'])
    end
  end 

  def self.create(name:, date_from:, date_to:, short_description:, price:)

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end

    #Next code is not working
    #return false if (name.to_s.empty?)
    #|| short_description.to_s.empty? || price.to_s.empty?)
    con.exec("INSERT INTO spaces (name, date_from, date_to, short_description, price) VALUES('#{name}','#{date_from}', '#{date_to}', '#{short_description}', '#{price}')")
  end
end
