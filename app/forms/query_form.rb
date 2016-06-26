class QueryForm
  include ActiveModel::Model

  attr_accessor :cep

  validates :cep, presence: true
end