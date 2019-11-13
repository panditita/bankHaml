class AccountTransaction < ApplicationRecord
  belongs_to :bank_account

  TRANSACTION_TYPES = ["withdraw", "deposit"]
    
  validates :bank_account, presence: true
  validates :amount, numericality: true, presence: true
  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }, presence: true
  validates :transaction_number, uniqueness: true, presence: true

before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end
end
