feature 'Add new link' do
  scenario 'A user can see the link they added' do
    visit('/')
    fill_in 'new_url', with: 'http://www.instagram.com'
    fill_in 'title', with: 'Instagram'
    click_button 'Submit'
    expect(page).to have_content 'Instagram'
  end
end
