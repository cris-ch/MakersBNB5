feature 'Booking one night slot' do
  scenario 'User enters date and name of the space' do
    visit('/spaces/booking')
    fill_in('name', with: "Brighton BnB")
    fill_in('stay_date', with: "01.02.2022")
    # click_button('Submit')

    # expect(page).to have_content "Brighton BnB"
    # expect(page).to have_content "01.02.2022"
  end  
end