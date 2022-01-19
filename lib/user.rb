class User

  attr_reader :id, :name, :email
  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
    # @password = password
  end

  def self.create(name:, email:, password:)

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end

    result = con.query(
      "INSERT INTO users (name, email, password) VALUES($1, $2, $3) RETURNING id, name, email;",
      [name, email, password]
    )
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.find(email: )

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'makersbnb_test'
    else
      con = PG.connect :dbname => 'makersbnb'
    end

    result = con.query('SELECT * FROM users WHERE email = $1', [email])
   
    user = User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end
end

