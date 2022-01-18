feature 'Adding a new space' do
  scenario 'User lists a new space' do
    visit('/spaces/new')

    fill_in 'name', with: 'Fuzzy Mountain BnB'
    fill_in 'short_description', with: 'Fuzzy'
    fill_in 'price', with: '100'
    click_on 'Submit'

    visit('/spaces/list')

    expect(page).to have_content 'Fuzzy Mountain BnB'

  end  
end
