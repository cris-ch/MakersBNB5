feature 'Adding a new space' do
  scenario 'User lists a new space' do
    visit('/spaces/new')

    fill_in 'name', with: 'Fuzzy Mountain BnB'
    fill_in 'date_from', with: '18-01-2022'
    fill_in 'date_to', with: '18-12-2022'
    fill_in 'short_description', with: 'Fuzzy'
    fill_in 'price', with: '100'

    click_on 'Submit'

    visit('/spaces/list')

    expect(page).to have_content 'Fuzzy Mountain BnB'
    expect(page).to have_content '18-01-2022'
    expect(page).to have_content '18-12-2022'

  end  
end
