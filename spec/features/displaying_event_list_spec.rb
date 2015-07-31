require 'rails_helper'

feature 'Can see a list of events on the index' do
  background do
    create(:user, id: 2, email: 'mario@nintendo.com', user_name: 'supermario', admin: true)
    create(:event, id: 1, title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2015-07-31', user_id: 2)
    create(:event, id: 2, title: 'Conquer Your Fears', content: 'Come look at my mansion!', presenter: 'Luigi', date: '2015-12-25', user_id: 2)
  end

  scenario 'the index lists all events' do
    visit events_path
    expect(page).to have_content('Jumping 101')
    expect(page).to have_content('Conquer Your Fears')
  end
end
