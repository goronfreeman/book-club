require 'rails_helper'

feature 'view individual events' do
  background do
    @user = create :user
    @admin = create(:user, id: 2, email: 'mario@nintendo.com', user_name: 'supermario', admin: true)
    create(:event, id: 1, title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2014-07-31', user_id: 2)
  end

  scenario 'admin user can click and view an event from the index' do
    sign_in_with(@admin)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page.current_path).to eq(event_path(1))
    expect(page).to have_content('Oh yeah! Mario time.')
  end

  scenario 'regular user user can click and view an event from the index' do
    sign_in_with(@user)
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page.current_path).to eq(event_path(1))
    expect(page).to have_content('Oh yeah! Mario time.')
  end

  scenario 'logged out user can click and view an event from the index' do
    visit events_path

    find(:xpath, "//a[contains(@href, 'events/1')]").click
    expect(page.current_path).to eq(event_path(1))
    expect(page).to have_content('Oh yeah! Mario time.')
  end
end
