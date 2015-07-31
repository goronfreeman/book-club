require 'rails_helper'

feature 'Editing events' do
  background do
    @user = create :user
    @admin = create(:user, id: 2, email: 'mario@nintendo.com', user_name: 'supermario', admin: true)
    @event = create(:event, id: 1, title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2015-07-31', user_id: 2)
  end

  scenario 'admin can edit an event' do
    sign_in_with(@admin)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page).to have_content('Edit Event')

    click_link 'Edit Event'
    fill_in 'Title', with: 'This Is a New Title'
    click_button 'Update Event'

    expect(page).to have_content('Your event has been updated.')
    expect(page).to have_content('This Is a New Title')
  end

  scenario 'admin cannot edit an event without a title' do
    sign_in_with(@admin)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page).to have_content('Edit Event')

    click_link 'Edit Event'
    fill_in 'Title', with: ''
    click_button 'Update Event'

    expect(page).to have_content('Something went wrong!')
  end

  scenario 'regular user cannot edit an event via the index' do
    sign_in_with(@user)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page).to_not have_content('Edit Event')
  end

  scenario 'regular user cannot edit an event via the url' do
    sign_in_with(@user)
    visit edit_event_path(@event)

    expect(page).to have_content("Hey! Don't do dat!")
    expect(page.current_path).to eq(events_path)
  end
end
