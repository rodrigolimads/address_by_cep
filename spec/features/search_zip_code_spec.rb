require "rails_helper"

RSpec.feature "Zip code", :type => :feature do
  describe 'Search a zip code' do
    before do
      visit '/'
      mock_auth_hash
      click_link "Here!!!"
    end
    
    context 'with a valid number' do
      before do
        fill_in "Zip code", :with => "05544000"
        click_button "Find"
      end

      it 'can find it', js: true do
        expect(page).to have_text("Zip code found:")
        expect(page).to have_text("05544000")
        expect(page).to have_text("Estrada de Santo Amaro, Jardim Guarau")
        expect(page).to have_text("São Paulo, SP")
      end

      it 'can find the last search on history', js: true do
        click_link 'Show history'
        expect(page).to have_text("Search history")
        expect(page).to have_selector('table tbody tr')
        expect(page).to have_text("Estrada de Santo Amaro")
      end
    end

    context 'with a invalid number' do
      before do
        fill_in "Zip code", :with => "12345678"
        click_button "Find"
      end

      it 'receive a flash error message', js: true do
        expect(page).to have_text('Could not find the zip code 12345678')
        expect(page).to_not have_text("Zip code found:")
      end
    end

    context 'without a number' do
      before do
        fill_in "Zip code", :with => ""
        click_button "Find"
      end

      it 'the field zip code is marked with error', js: true do
        expect(page).to have_text("can't be blank")
        expect(page).to have_css('div .form-group.has-error')
      end
    end
  end
end