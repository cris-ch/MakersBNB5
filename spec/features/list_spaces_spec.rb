feature 'Adding a new space' do
  scenario 'User lists a new space' do
    visit('/spaces/new')

    fill_in 'name', with: 'Fuzzy Mountain BnB'
    fill_in 'date_from', with: 18-01-2022
    fill_in 'date_to', with: 18-12-2022
    click_on 'Submit'

    expect(page).to have_content 'Fuzzy Mountain BnB'

  end  
end
