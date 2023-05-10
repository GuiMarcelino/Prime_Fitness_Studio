class Payment < ApplicationRecord

  # Relationship
  belongs_to :customer

  # Validations
  validates :paid, presence: true
end
