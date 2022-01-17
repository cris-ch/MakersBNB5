feature 'Testing infrastructure' do
  scenario 'Can run app basic landing page' do
    visit '/'
    expect(page).to have_content 'Welcome to Makers BnB'
  end
end