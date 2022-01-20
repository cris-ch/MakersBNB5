feature 'authentication' do
  it 'a user can sign in' do
    User.create(name: 'Alister', email: 'iwjnv@wjnvwe.com', password: 'password')

    visit '/sessions/new'

    fill_in(:email, with: 'iwjnv@wjnvwe.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Alister'
  end

  it 'a user sees an error if they enter the wrong email' do
    User.create(name: 'Alister', email: 'iwjnv@wjnvwe.com', password: 'password')

    visit '/sessions/new'
    fill_in(:email, with: 'wrongemail@wrong.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, iwjnv@wjnvwe.com'
    expect(page).to have_content 'Please check your email or password'
  end

  it 'a user sees an error if they get their password wrong' do
    User.create(name: 'Alister', email: 'iwjnv@wjnvwe.com', password: 'password')

    visit '/sessions/new'
    fill_in(:email, with: 'iwjnv@wjnvwe.com')
    fill_in(:password, with: 'wrongpass')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, iwjnv@wjnvwe.com'
    expect(page).to have_content 'Please check your email or password'
  end

  it 'a user can sign out' do
    User.create(name: 'Alister', email: 'iwjnv@wjnvwe.com', password: 'password')

    visit '/sessions/new'
    fill_in(:email, with: 'iwjnv@wjnvwe.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, iwjnv@wjnvwe.com'
    expect(page).to have_content 'You have signed out.'
  end

end 