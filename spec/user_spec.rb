require  'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Alister', email: 'ajsjh@vnowenv.com', password: '9798275')

      expect(user).to be_a User
      expect(user.name).to eq 'Alister'
      expect(user.email).to eq 'ajsjh@vnowenv.com'
    end
  end

  describe '.find' do
    it 'finds a user bytheir id' do
      user = User.create(name: 'Alister', email: 'ajsjh@vnowenv.com', password: '9798275')
      result = User.find(email: user.email)


      expect(result.email).to eq user.email
    end
  end
end
