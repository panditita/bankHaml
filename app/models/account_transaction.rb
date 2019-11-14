# frozen_string_literal: true

class AccountTransaction < ApplicationRecord
  belongs_to :bank_account

  TRANSACTION_TYPES = %w[withdraw deposit].freeze

  validates :bank_account, presence: true
  validates :amount, numericality: true, presence: true
  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }, presence: true
  validates :transaction_number, uniqueness: true, presence: true

  before_validation :load_defaults

  def load_defaults
    self.transaction_number = SecureRandom.uuid if new_record?
  end
end
