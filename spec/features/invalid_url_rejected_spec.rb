feature 'Invalid URL rejected' do
  scenario 'Error message when invalid URL entered' do
    visit('/')
    fill_in 'new_url', with: 'what_the_HECK'
    click_button 'Submit'
    expect(page).to have_content 'Invalid URL; not added! :-('
  end
end
