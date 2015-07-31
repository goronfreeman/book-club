require 'rails_helper'

feature 'User authentication' do
  background do
    @user = create :user
    visit '/'
  end

  scenario 'can log in from the home page' do
    expect(page).to_not have_content('fancyfrank')

    sign_in_with(@user)

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('fancyfrank')
  end

  scenario 'can update account details' do
    sign_in_with(@user)

    click_link 'Edit Profile'
    fill_in 'User name', with: 'supermario'
    fill_in 'Current password', with: 'illbeback'
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('supermario')
  end

  scenario 'can log out once logged in' do
    sign_in_with(@user)

    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'cannot create an event without logging in' do
    visit new_event_path
    expect(page).to have_content("Hey! Don't do dat!")
  end
end
