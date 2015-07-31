require 'rails_helper'

feature 'Creating events' do
  background do
    @user = create :user
    @admin = create(:user, id: 2, email: 'mario@nintendo.com', user_name: 'supermario', admin: true)
  end

  scenario 'regular users cannot create an event via events page' do
    sign_in_with(@user)
    visit events_path
    expect(page).to_not have_content('Add Event')
  end

  scenario 'regular users cannot create an event via url' do
    sign_in_with(@user)
    visit '/events/new'
    expect(page).to have_content("Hey! Don't do dat!")
    expect(page.current_path).to eq(events_path)
  end

  scenario 'admin users can create an event' do
    sign_in_with(@admin)
    visit events_path
    click_link 'Add Event'

    fill_in 'Title', with: 'Title'
    fill_in 'Date', with: '2015-12-15'
    fill_in 'Content', with: 'This is some content.'
    click_button 'Create Event'
    expect(page).to have_content('Your event has been created.')
    expect(page).to have_content('Title')
    expect(page).to have_content('This is some content.')
  end

  scenario 'admin users events must have a title' do
    sign_in_with(@admin)
    visit events_path
    click_link 'Add Event'

    fill_in 'Title', with: ''
    fill_in 'Date', with: '2015-12-15'
    fill_in 'Content', with: 'This is some content.'
    click_button 'Create Event'
    expect(page).to have_content('Something went wrong!')
    expect(page.current_path).to eq(events_path)
    expect(page).to have_content('Title')
  end
end
