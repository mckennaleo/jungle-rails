  
require 'rails_helper'

RSpec.feature "User Login", type: :feature, js: true do

    scenario "User can login to account" do
      visit ('/login')

      user = User.create(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")

      fill_in 'email', with: "alyssa@sidewalkplants.com"
      fill_in 'password', with: "apple!123"
      click_button 'Submit'

      within "nav" do
        expect(page).to have_css '.logged-in', 'Alyssa'
      end
    end
  
  end