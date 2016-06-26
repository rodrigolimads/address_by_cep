require 'rails_helper'

describe QueriesController, type: :controller do
  render_views

  describe "GET 'query'" do
    before do
      get :query
    end

    it 'response succesful' do
      expect(response).to be_successful
    end

    it 'render template query' do
      expect(response).to render_template(:query)
    end
  end

  describe "GET 'search_cep'" do
    context 'with valid cep' do
      before do
        VCR.use_cassette('search_cep_05544000') do
          params = { query_form: { cep: "05544000" } }
          get :search_cep, params, format: 'js'
        end
      end
    end

    it 'response succesful' do
      expect(response).to be_successful
    end
  end
end