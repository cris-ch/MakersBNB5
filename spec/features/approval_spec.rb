feature 'Approval of bookings' do
  scenario 'Owner of space sees a booking request' do
  

    # a user visits the page and adds a space.

    visit('/spaces/new')

    fill_in 'name', with: 'Fuzzy Mountain BnB'
    fill_in 'date_from', with: '18-01-2022'
    fill_in 'date_to', with: '18-12-2022'
    fill_in 'short_description', with: 'Fuzzy'
    fill_in 'price', with: '100'

    click_on 'Submit'

    # a user requests a booking
    visit('/spaces/list')

    fill_in('stay_date', with: "01.02.2022")
    click_button('Booking')

    visit('/spaces/approve')
    
    expect(page).to have_content 'Fuzzy Mountain BnB'
  end

  scenario 'Owner approves a booking request' do
  

    # a user visits the page and adds a space.

    visit('/spaces/new')

    fill_in 'name', with: 'Fuzzy Mountain BnB'
    fill_in 'date_from', with: '18-01-2022'
    fill_in 'date_to', with: '18-12-2022'
    fill_in 'short_description', with: 'Fuzzy'
    fill_in 'price', with: '100'

    click_on 'Submit'

    # a user requests a booking
    visit('/spaces/list')

    fill_in('stay_date', with: "01.02.2022")
    click_button('Booking')


    # user appoves a booking
    visit('/spaces/approve')
    click_on("Approve")
    
    expect(page).to have_content 'You have approved this booking'
  end

end

