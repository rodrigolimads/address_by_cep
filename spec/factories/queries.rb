FactoryGirl.define do
  factory :query do
    cep '22070011'
    status 1
    response({"cep":"22070011","tipoDeLogradouro":"Avenida","logradouro":"Nossa Senhora de Copacabana","bairro":"Copacabana","cidade":"Rio de Janeiro","estado":"RJ"})
  end
end