require 'pg'

class Space

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end
    result = con.exec "SELECT * FROM spaces"
    result.map { |space| space['name']}
  end 

  def self.create(name:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end
  
    con.exec("INSERT INTO spaces (name) VALUES('#{name}')")
  end
end