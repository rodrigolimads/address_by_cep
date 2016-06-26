require 'rails_helper'

RSpec.describe Query, type: :model do
  describe 'Validations' do
    it_has_behavior "Requires Presence", :query, [ :cep, :status, :response ]
  end

end
