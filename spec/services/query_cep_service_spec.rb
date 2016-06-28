require 'rails_helper'

RSpec.describe QueryCepService, type: :service do
  let(:response) {
    VCR.use_cassette('cep_05544000') do
      QueryCepService.new('05544000').find
    end
  }

  let(:invalid_response) {
    VCR.use_cassette('cep_12345678') do
      QueryCepService.new('12345678').find
    end
  }


  describe '#find' do
    context 'with valid cep' do
      it '#cep method' do
        expect(response.cep).to eq('05544000')
      end

      it '#tipo_de_logradouro method' do
        expect(response.tipo_de_logradouro).to eq('Estrada')
      end

      it '#logradouro method' do
        expect(response.logradouro).to eq('de Santo Amaro')
      end

      it '#bairro method' do
        expect(response.bairro).to eq('Jardim Guarau')
      end

      it '#cidade method' do
        expect(response.cidade).to eq('São Paulo')
      end

      it '#estado method' do
        expect(response.estado).to eq('SP')        
      end

      it 'return a object with method cep' do
        expect(response).to respond_to(:cep)
      end

      it 'return a object with method tipo_de_logradouro' do
        expect(response).to respond_to(:tipo_de_logradouro)
      end

      it 'return a object with method logradouro' do
        expect(response).to respond_to(:logradouro)
      end

      it 'return a object with method bairro' do
        expect(response).to respond_to(:bairro)
      end

      it 'return a object with method cidade' do
        expect(response).to respond_to(:cidade)
      end

      it 'return a object with method estado' do
        expect(response).to respond_to(:estado)
      end
    end

    context 'with invalid cep' do

      it 'return a hash' do
        expect(invalid_response).to be_a(Hash)
      end

      it 'have a error message' do
        expect(invalid_response.dig(:error)).to eq('Could not find the zip code 12345678')
      end
    end
  end

end
