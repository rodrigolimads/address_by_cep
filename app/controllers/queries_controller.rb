class QueriesController < ApplicationController
  def query
    @query_form = QueryForm.new
  end

  def search_cep
    @query_form = QueryForm.new(query_params)
    if @query_form.valid?
      @result = QueryCepService.new(@query_form.cep).find
    end
  end

  private
  def query_params
    params.require(:query_form).permit(:cep)
  end
end
