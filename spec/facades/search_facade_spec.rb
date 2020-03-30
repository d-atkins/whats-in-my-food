require 'rails_helper'

describe SearchFacade do
  describe 'methods' do
    it 'get_foods', :vcr do
      first_expected = {
        :description=>"REAL VEGETABLE CHIPS",
        :code=>"728229015529",
        :brand_owner=>"The Hain Celestial Group, Inc.",
        :ingredients=>"A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.",
      }

      search_facade = SearchFacade.new('sweet potatoes')
      foods = search_facade.get_foods

      expect(foods.count).to eq(10)
      expect(foods.first.description).to eq(first_expected[:description])
      expect(foods.first.code).to eq(first_expected[:code])
      expect(foods.first.brand_owner).to eq(first_expected[:brand_owner])
      expect(foods.first.ingredients).to eq(first_expected[:ingredients])
    end
  end
end
