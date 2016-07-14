require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    # Verify flash messaging
    expect(page).to have_content('1967 Ford Mustang created')

    # Verify the price of the car is on the page
    expect(page).to have_content('2300')
  end

  scenario 'can add a second car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Prius'
    fill_in 'Year', with: '1965'
    fill_in 'Price', with: '2567'

    click_button 'Create Car'

    # Verify flash messaging
    expect(page).to have_content('1965 Toyota Prius created')

    # Verify the price of the car is on the page
    expect(page).to have_content('1967 Ford Mustang 2300')
    expect(page).to have_content('1965 Toyota Prius 2567')
  end
end
