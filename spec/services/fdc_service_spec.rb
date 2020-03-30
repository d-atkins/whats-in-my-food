require 'rails_helper'

describe FdcService do
  describe 'methods' do
    it 'get_food_data', :vcr do
      first_expected = {
        :fdcId=>574779,
        :description=>"REAL VEGETABLE CHIPS",
        :dataType=>"Branded",
        :gtinUpc=>"728229015529",
        :publishedDate=>"2019-04-01",
        :brandOwner=>"The Hain Celestial Group, Inc.",
        :ingredients=>"A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.",
        :allHighlightFields=>"<b>Ingredients</b>: A BLEND OF <em>SWEET</em> <em>POTATOES</em> (<em>SWEET</em> <em>POTATO</em>, PURPLE <em>SWEET</em> <em>POTATO</em>, BATATA), AVOCADO OIL, SEA SALT.",
        :score=>-742.13696
      }

      service = FdcService.new
      food_data = service.get_food_data('sweet potatoes')

      expect(food_data.count).to eq(50)
      expect(food_data.first).to eq(first_expected)
    end
  end
end
