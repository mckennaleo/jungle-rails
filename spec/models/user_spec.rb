require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "is valid with valid attributes" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.new(email: nil, first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")
      expect(user).to_not be_valid
    end
    
    it "is not valid without a first name" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")
      expect(user).to_not be_valid
    end

    it "is not valid without a last name" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "", password: "apple!123", password_confirmation: "apple!123")
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "", password_confirmation: "apple!123")
      expect(user).to_not be_valid
    end

    it "is not valid without a password confirmation" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "")
      expect(user).to_not be_valid
    end

    it "is not valid if password and password confirmation do not match" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!")
      expect(user).to_not be_valid
    end

    it "is not valid if password is less than 6 characters" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple", password_confirmation: "apple")
      expect(user).to_not be_valid
    end

    it "is not valid if email is not unique" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")

      user.save

      another_user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")

      expect(another_user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "is valid with valid attributes" do
      user = User.new(email: "alyssa@sidewalkplants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")

      expect(user).to be_valid
    end
    it "makes email letters downcase" do
      user = User.new(email: "alySSa@SidewalkPlants.com", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")

      user.save

      expect(user[:email]).to be == ("alyssa@sidewalkplants.com")
    end
    it "trims whitespace around email" do
      user = User.new(email: " alyssa@sidewalkplants.com ", first_name: "Alyssa", last_name: "BT", password: "apple!123", password_confirmation: "apple!123")

      user.save

      expect(user[:email]).to be ==("alyssa@sidewalkplants.com")
    end
  end
end