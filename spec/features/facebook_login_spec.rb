require "rails_helper"

RSpec.feature "Login", :type => :feature do
  describe 'access root page' do

    context 'with valid credentials' do
      before do
        mock_auth_hash
      end
  
      it 'can sign in user with facebook credentials' do
        visit '/'
        expect(page).to have_text("You need to sign in or sign up before continuing.")
        click_link "Here!!!"
        expect(page).to have_text("test@example.com")
        expect(page).to have_text('Successfully authenticated from Facebook account.')

      end
    end

    context 'with invalid credentials' do
      before do
        OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      end
      
      it 'cannot sing in user' do
        visit '/'
        click_link "Here!!!"
        expect(page).to_not have_text('Logout')
      end

    end
  end
end