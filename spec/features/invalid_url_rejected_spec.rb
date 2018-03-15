feature 'Invalid URL rejected' do
  scenario 'Error message when invalid URL entered' do
    visit('/')
    fill_in 'new_url', with: 'what_the_HECK'
    fill_in 'title', with: 'what the HECK'
    click_button 'Submit'

    expect(page).not_to have_content 'what the HECK'
    expect(page).to have_content 'Invalid URL, not added! :-('
  end
end
