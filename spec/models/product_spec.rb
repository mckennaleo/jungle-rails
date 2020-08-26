require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "is valid with valid attributes" do
      category = Category.new(name: "Sporting Goods")
      product = Product.new(name: "Helmet", price: 50, quantity: 15, category: category)
      expect(product).to be_valid
    end
    it "is not valid without a name" do
      category = Category.new(name: "Sporting Goods")
      product = Product.new(name: "", price: 50, quantity: 15, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without a price" do
      category = Category.new(name: "Sporting Goods")
      product = Product.new(name: "Helmet", price: nil, quantity: 15, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without a quantity" do
      category = Category.new(name: "Sporting Goods")
      product = Product.new(name: "Helmet", price: 50, quantity: nil, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without a category" do
      product = Product.new(name: "Helmet", price: 50, quantity: 15, category: nil)
      expect(product).to_not be_valid
    end

  end
end