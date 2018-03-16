feature 'Updating a link' do
  scenario 'A user can update a link' do
    visit('/update-link/1')

    fill_in('url', with: 'http://www.bloomberg.com')
    fill_in('title', with: 'Bloomberg')
    click_button('Submit')

    expect(current_path).to eq '/'
    expect(page).not_to have_content 'Makers Academy'
    expect(page).to have_content 'Bloomberg'

  end
end
