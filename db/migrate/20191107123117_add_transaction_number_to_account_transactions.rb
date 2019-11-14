# frozen_string_literal: true

class AddTransactionNumberToAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :account_transactions, :transaction_number, :string
  end
end
