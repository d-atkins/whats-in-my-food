require 'rails_helper'

describe 'From the welcome page:', type: :feature do
  describe 'searching for an ingredient' do
    before(:each) do
      visit '/'
      fill_in 'q', with: 'sweet potatoes'
      click_button('Search')
    end

    it 'returns a list of foods containing that ingredient' do
      expect(current_path).to eq(foods_path)
      
    end
  end

end
