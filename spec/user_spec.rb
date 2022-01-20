require  'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      expect(BCrypt::Password).to receive(:create).with('9798275')
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

  describe '.find' do
    it 'returns nil if there is no email given' do
      expect(User.find(email: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(name: 'test', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end
  end

  describe '.authenticate' do
    it 'returns nil after providing an incorrect email' do
      user = User.create(name: 'test', email: 'test@example.com', password: 'password123')

      expect(User.authenticate(email: 'incorrectemail@wrong.com', password: 'password123')).to be_nil
    end 
  end 
end
