require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the home page' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'User name', with: 'tester'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'require a user name to be more than 3 characters' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'User name', with: 't'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'require a user name to be less than 17 characters' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'User name', with: 't' * 17
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('maximum is 16 characters')
  end
end
