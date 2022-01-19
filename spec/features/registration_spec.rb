feature 'registration' do
  scenario 'a user can sign up to Mkers BNB' do
    visit('/users/new')
    fill_in 'name', with: 'Pingu'
    fill_in 'email', with: 'pingu@pingu.com'
    fill_in 'password', with: 'moop'
    click_on 'Register'

    expect(page).to have_content 'Pingu'
  end
end