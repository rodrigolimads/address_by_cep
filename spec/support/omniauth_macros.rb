module OmniauthMacros
  def mock_auth_hash
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: 'facebook',
        uid: '123545',
        info: {
          first_name: "Teste",
          last_name:  "User",
          email:      "test@example.com"
        },
        credentials: {
          token: "123456",
          expires_at: Time.now + 1.week
        }
      })
    end
  end

  def mock_invalid_auth_hash
    
  end
end