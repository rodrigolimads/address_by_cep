class QueryCepService
  URL_BASE = 'http://correiosapi.apphb.com/cep/'

  def initialize(cep)
    @cep = cep
    @url = URL_BASE + @cep
  end

  def find
    begin
      response = RestClient.get @url
      register_integration(response)
      ObjectifiedResponseService.new(response).object
    rescue RestClient::ResourceNotFound => e
      { error: "CEP #{@cep} não encontrado!" }
    rescue RestClient::Exception => e
      { error: 'Não foi possível acessar a API pública de consulta de CEPs' }
    end
  end

  private
  def register_integration(response)
    Query.create!( cep: @cep, status: response.code.eql?(200) ? 1 : 0,  response: response )
  end
end