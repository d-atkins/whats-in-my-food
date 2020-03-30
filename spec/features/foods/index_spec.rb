require 'rails_helper'

describe 'From the welcome page:', type: :feature do
  describe 'searching for an ingredient', :vcr do
    before(:each) do
      visit '/'
      fill_in 'q', with: 'sweet potatoes'
      click_button('Search')
    end

    it 'returns a list of foods containing that ingredient' do
      expect(current_path).to eq(foods_path)
      expect(page).to have_css('#search_result', count: 50)
      within('#search_result', match: :first) do
        expected = {
          description: 'REAL VEGETABLE CHIPS',
          code: '728229015529',
          brand_owner: 'The Hain Celestial Group, Inc.',
          ingredients: 'A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.'
        }

        within('#description') { expect(page).to have_content(expected[:description]) }
        within('#gtinupc_code') { expect(page).to have_content(expected[:code]) }
        within('#brand_owner') { expect(page).to have_content(expected[:brand_owner]) }
        within('#ingredients') { expect(page).to have_content(expected[:ingredients]) }
      end
    end
  end
end
