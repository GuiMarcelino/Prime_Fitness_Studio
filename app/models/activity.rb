# frozen_string_literal: true

class Activity < ApplicationRecord
  # Validations
  validates :name, :shift, presence: true
end
