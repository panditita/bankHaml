# frozen_string_literal: true

module BankAccounts
  class ValidateNewTransaction
    
    def initialize(amount:, transaction_type:, bank_account_id:)
      @amount = amount.try(:to_f)
      @transaction_type = transaction_type
      @bank_account_id = bank_account_id
      @bank_account = BankAccount.where(id: @bank_account_id).first
      @errors = []
    end

    def execute!
      validate_existence_of_account!

      if (@transaction_type == 'withdraw') && @bank_account.present?
        validate_withdrawal!
      end

      @errors
    end

    private

    def validate_withdrawal!
      @errors << 'Not enough funds' if @bank_account.balance - @amount < 0.00
    end

    def validate_existence_of_account!
      @errors << 'Account not found' if @bank_account.blank?
    end
  end
end
