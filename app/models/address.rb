# frozen_string_literal: true

class Address < ApplicationRecord

  # Validations
  validates :city, :country, :neighborhood, :number, :street, :state,
    presence: true
end
