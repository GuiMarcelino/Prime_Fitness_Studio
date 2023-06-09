# frozen_string_literal: true

class User < ApplicationRecord
  # Constants
  # KINDS = %i[associate coach financial].freeze

  has_many :user_activities
  has_many :activities, through: :user_activities

  # Validations
  validates :name, :username, :email, :password_digest,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  # Enumerize
  # extend Enumerize
  # enumerize :kind, in: KINDS, predicates: true
end
