require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'instantiation' do
    it 'attributes' do
      attributes = {
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

      food = Food.new(attributes)

      expect(food.description).to eq(attributes[:description])
      expect(food.code).to eq(attributes[:gtinUpc])
      expect(food.brand_owner).to eq(attributes[:brandOwner])
      expect(food.ingredients).to eq(attributes[:ingredients])
    end
  end
end
