module QueriesHelper
  def table_line
    string = <<-HTML
      <tr>
        <td>#{@result.cep}</td>
        <td>#{@result.tipo_de_logradouro} #{@result.logradouro}</td>
        <td>#{@result.bairro}</td>
        <td>#{@result.cidade}</td>
        <td>#{@result.estado}</td>
      </tr>
    HTML
    string.html_safe
  end

  def error_flash_line
    string = <<-HTML
      <div class='alert alert-danger' role='alert'>
        <button type='button' class='close' data-dismiss='alert'>×</button>
        #{@result.dig(:error)}
      </div>
    HTML
    string.html_safe
  end

  def field_error
    content_tag(:span, @query_form.errors.messages.dig(:cep).first, class: 'text-error')
  end
end