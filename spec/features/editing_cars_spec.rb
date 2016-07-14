require 'rails_helper'

feature 'Editing Cars' do
  scenario 'can edit a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    click_link 'Edit'

    fill_in 'Price', with: '3567'

    click_button 'Update Car'

    # Verify flash messaging
    expect(page).to have_content('1967 Ford Mustang updated')

    # Verify the price of the car is on the page
    expect(page).to have_content('1967 Ford Mustang 3567')
  end
end
