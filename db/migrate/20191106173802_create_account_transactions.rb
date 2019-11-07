class CreateAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :account_transactions do |t|
      t.decimal :amount
      t.string :transaction_type
      t.references :bank_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
