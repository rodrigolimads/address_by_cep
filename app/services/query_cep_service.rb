class QueryCepService
  URL_BASE = 'http://correiosapi.apphb.com/cep/'

  def initialize(cep)
    @cep = cep
    @url = URL_BASE + @cep
  end

  def find
    begin
      hash = JSON.parse RestClient.get @url
      objectify(hash)
    rescue RestClient::ResourceNotFound => e
      { error: "CEP #{@cep} não encontrado!" }
    rescue RestClient::Exception => e
      { error: 'Não foi possível acessar a API pública de consulta de CEPs' }
    end
  end

  private
  def objectify(hash)
    OpenStruct.new(underscore_keys(hash))
  end

  def underscore_keys(hash)
    hash.transform_keys! {|k| k.underscore }
  end
end