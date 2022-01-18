require 'pg'

class Space

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end
    result = con.exec "SELECT * FROM spaces"
    name = result.map { |space| space['name']}
    date_from = result.map { |space| space['date_from']}
    date_to = result.map { |space| space['date_to']}
    all_spaces = name + date_from + date_to
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