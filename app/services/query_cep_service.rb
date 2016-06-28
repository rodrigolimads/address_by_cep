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
      { error: I18n.t('errors.api.not_found', zipcode: @cep) }
    rescue RestClient::Exception => e
      { error: I18n.t('errors.api.general') }
    end
  end

  private
  def register_integration(response)
    Query.create!( cep: @cep, status: response.code.eql?(200) ? 1 : 0,  response: response )
  end
end