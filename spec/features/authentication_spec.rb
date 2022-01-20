feature 'authentication' do
  it 'a user can sign in' do
    User.create(name: 'Alister', email: 'iwjnv@wjnvwe.com', password: 'password')

    visit '/sessions/new'

    fill_in(:email, with: 'iwjnv@wjnvwe.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Alister'
  end
end

feature 'authentication' do
  it 'a user sees an error if they enter the wrong email' do
    User.create(name: 'Alister', email: 'iwjnv@wjnvwe.com', password: 'password')

    visit '/sessions/new'
    fill_in(:email, with: 'wrongemail@wrong.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, iwjnv@wjnvwe.com'
    expect(page).to have_content 'Please check your email or password'
  end
end 