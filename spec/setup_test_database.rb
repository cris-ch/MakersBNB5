require 'pg'

p "Setting up test DB..."

def setup_test_database
  con = PG.connect(dbname: "makersbnb_test")
  con.exec('TRUNCATE spaces, users, booking')
end