# frozen_string_literal: true

class BankAccount < ApplicationRecord
  belongs_to :client

  validates :client, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, numericality: true, presence: true

  before_validation :load_defaults

  has_many :account_transactions

  def load_defaults
    self.balance = 0.00 if new_record?
  end

  def to_s
    account_number
  end
end
