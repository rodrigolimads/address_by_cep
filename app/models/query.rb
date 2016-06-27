class Query < ActiveRecord::Base
  validates :cep, :status, :response, presence: true

  scope :successful, -> { where(status: true)}
end