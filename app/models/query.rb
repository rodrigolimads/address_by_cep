class Query < ActiveRecord::Base
  validates :cep, :status, :response, presence: true
end