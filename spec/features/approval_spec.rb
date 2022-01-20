feature 'Approval of bookings' do
  scenario 'Owner of space approves booking' do
    visit '/spaces/approve'
  
    # fill_in('name', with: 'New Forest Hotel')
    # fill_in('date', with: '10-03-2022')
    # click_on('submit')
    # expect(find_field('Approve')).to be_checked

    click_on('Approve')
    
    expect(page).to have_content "You have approved this booking"
  end
end

