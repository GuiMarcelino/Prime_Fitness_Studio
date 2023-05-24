# frozen_string_literal: true

class Activity < ApplicationRecord
  # Validations

  has_many :user_activities
  has_many :users, through: :user_activities

  validates :name, :shift, presence: true
end
