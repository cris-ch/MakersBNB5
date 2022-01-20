feature 'Booking one night slot' do
  scenario 'User enters date and name of the space' do
    
    visit('/spaces/new')

    fill_in 'name', with: 'Brighton BnB'

    click_on 'Submit'
    
    visit('/spaces/list')

    fill_in('stay_date', with: "01.02.2022")
    click_button('Booking')

    expect(page).to have_content "Brighton BnB"
    expect(page).to have_content "01.02.2022"
  end  
end