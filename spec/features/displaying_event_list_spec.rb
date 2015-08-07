require 'rails_helper'

feature 'Can see a list of events on the index' do
  background do
    admin = create(:user, email: 'mario@nintendo.com', user_name: 'supermario', admin: true)

    @upcoming_one = create(:event, title: 'Questing 101', content: "Let's save Zelda!", presenter: 'Link', date: '2016-01-01', user_id: admin.id)
    @upcoming_two = create(:event, title: 'Ruling Hyrule', content: "It's not always easy", presenter: 'Zelda', date: '2016-01-02', user_id: admin.id)
    @upcoming_three = create(:event, title: 'King of All Evil', content: 'I will rule the world!', presenter: 'Ganon', date: '2016-01-03', user_id: admin.id)
    @upcoming_four = create(:event, title: 'How to Listen', content: 'Hey! Listen!', presenter: 'Navi', date: '2016-01-04', user_id: admin.id)
    @upcoming_five = create(:event, title: 'Conservation', content: 'The children of the forest love me!', presenter: 'Great Deku Tree', date: '2016-01-05', user_id: admin.id)
    @upcoming_six = create(:event, title: 'Child Rearing', content: 'Children can be very difficult', presenter: 'Impa', date: '2016-01-06', user_id: admin.id)

    @past_one = create(:event, title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2014-01-01', user_id: admin.id)
    @past_two = create(:event, title: 'Conquer Your Fears', content: 'Come look at my mansion!', presenter: 'Luigi', date: '2014-01-02', user_id: admin.id)
    @past_three = create(:event, title: 'How to Rule', content: 'Join me at my castle for cake.', presenter: 'Peach', date: '2014-01-03', user_id: admin.id)
    @past_four = create(:event, title: 'Treasure Tracking', content: 'I am the ultimate tracker of treasure!', presenter: 'Toad', date: '2014-01-04', user_id: admin.id)
    @past_five = create(:event, title: 'Crush Your Foes', content: 'Rule with an iron fist!', presenter: 'Bowser', date: '2014-01-05', user_id: admin.id)
    @past_six = create(:event, title: 'Shell Care', content: 'Your shell is your greatest possession', presenter: 'Koopa', date: '2014-01-06', user_id: admin.id)
  end

  # scenario 'the index lists all events' do
  #   visit events_path
  #   expect(page).to have_content('Jumping 101')
  #   expect(page).to have_content('Conquer Your Fears')
  # end

  scenario 'the upcoming events section lists at only upcoming events' do
    visit events_path
    expect(page).to have_css('section.upcoming', text: @upcoming_one.title)
    expect(page).to have_css('section.upcoming', text: @upcoming_two.title)
    expect(page).to have_css('section.upcoming', text: @upcoming_three.title)
    expect(page).to have_css('section.upcoming', text: @upcoming_four.title)
    expect(page).to have_css('section.upcoming', text: @upcoming_five.title)
    # expect(page).to_not have_css('section.upcoming', text: @upcoming_six.title)
    expect(page).to_not have_css('section.upcoming', text: @past_one.title)
  end

  scenario 'the past events section lists only past events' do
    visit events_path
    expect(page).to have_css('section.past', text: @past_one.title)
    expect(page).to have_css('section.past', text: @past_two.title)
    expect(page).to have_css('section.past', text: @past_three.title)
    expect(page).to have_css('section.past', text: @past_four.title)
    expect(page).to have_css('section.past', text: @past_five.title)
    # expect(page).to_not have_css('section.past', text: @past_six.title)
    expect(page).to_not have_css('section.past', text: @upcoming_one.title)
  end
end
