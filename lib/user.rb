class User

  attr_reader :id, :name, :email
  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    result = PG.connect.query(
      "INSERT INTO users (name, email, password) VALUES($1, $2, $3) RETURNING id, name, email;",
      [name, email, password]
    )
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end
end

