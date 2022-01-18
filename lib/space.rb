require 'pg'

class Space
  attr_reader :name, :date_from, :date_to

  def initialize(name:, date_from:, date_to:)
    @name = name
    @date_from = date_from
    @date_to = date_to
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end
    result = con.exec "SELECT * FROM spaces"
    result.map do |space|
      Space.new(name: space['name'], date_from: space['date_from'], date_to: space['date_to'])
    end
  end 

  def self.create(name:, date_from:, date_to:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end

    con.exec("INSERT INTO spaces (name, date_from, date_to) VALUES('#{name}', '#{date_from}', '#{date_to}')")
  end
end


# US4 - we want to be able to list available from and to dates when adding a property. 
# We need to passing two parameters on .create method. 
# Update the SQL exec code line