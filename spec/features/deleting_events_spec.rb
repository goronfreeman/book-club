require 'rails_helper'

feature 'Deleting events' do
  background do
    @user = create :user
    @admin = create(:user, id: 2, email: 'mario@nintendo.com', user_name: 'supermario', admin: true)
    @event = create(:event, id: 1, title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2014-07-31', user_id: 2)
  end

  scenario 'admin can delete an event' do
    sign_in_with(@admin)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page).to have_content('Jumping 101')
    expect(page).to have_content('Delete Event')

    click_link 'Delete Event'

    expect(page).to have_content('Your event has been deleted.')
    expect(page).to_not have_content('Jumping 101')
  end

  scenario 'regular user cannot delete an event via the index' do
    sign_in_with(@user)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page).to_not have_content('Delete Event')
  end

  scenario 'regular user cannot delete an event via the url' do
    sign_in_with(@user)
    visit events_path
    page.driver.submit :delete, 'events/1', {}

    expect(page).to have_content("Hey! Don't do dat!")
    expect(page).to have_content('Jumping 101')
    expect(page.current_path).to eq(events_path)
  end

  scenario 'logged out user cannot delete an event via the index' do
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page).to_not have_content('Delete Event')
  end

  scenario 'logged out user cannot delete an event via the url' do
    visit events_path
    page.driver.submit :delete, 'events/1', {}

    expect(page).to have_content("Hey! Don't do dat!")
    expect(page).to have_content('Jumping 101')
    expect(page.current_path).to eq(events_path)
  end
end
