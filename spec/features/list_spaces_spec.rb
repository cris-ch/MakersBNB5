feature 'Adding a new space' do
  scenario 'User lists a new space' do
    visit('/spaces/new')

    fill_in 'name', with: 'Fuzzy Mountain BnB'
    click_on 'Submit'

    expect(page).to have_content 'Fuzzy Mountain BnB'

  end  
end
