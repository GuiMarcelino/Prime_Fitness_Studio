# frozen_string_literal: true

class Customer < ApplicationRecord
  # Constants
  GENDER = %i[female male other].freeze

  # Validations
  validates :active, :email, :gender, :name, :phone_number,
    presence: true

  # Enumerize
  extend Enumerize
  enumerize :gender, in: GENDER, predicates: true
end
