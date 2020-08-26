require 'rails_helper'

RSpec.feature "Visitor can add item to cart", type: :feature, js: true do

    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  
    scenario "Cart quantity increases by 1" do
      visit ('/')

      within ".products" do
        expect(page).to have_button('Add')
        first(:button, "Add").click
      end

      within "nav" do
        expect(page).to have_content("My Cart (1)")
      end
    end
  
  end