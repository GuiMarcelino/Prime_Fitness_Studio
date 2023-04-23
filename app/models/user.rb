# frozen_string_literal: true

class User < ApplicationRecord
  # Constants
  KINDS = %i[associate coach financial].freeze

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Validations
  validates :name, :kind, :email, :password, :password_confirmation,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  # Enumerize
  extend Enumerize
  enumerize :kind, in: KINDS, predicates: true
end
