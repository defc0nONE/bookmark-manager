feature 'Add new link' do
  scenario 'A user can see the link they added' do
    visit('/')
    fill_in 'new_url', with: 'http://www.instagram.com'
    click_button 'Submit'
    expect(page).to have_content 'http://www.instagram.com'
  end
end
