# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_107_123_117) do
  create_table 'account_transactions', force: :cascade do |t|
    t.decimal 'amount'
    t.string 'transaction_type'
    t.integer 'bank_account_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'transaction_number'
    t.index ['bank_account_id'], name: 'index_account_transactions_on_bank_account_id'
  end

  create_table 'bank_accounts', force: :cascade do |t|
    t.integer 'client_id', null: false
    t.decimal 'balance'
    t.string 'account_number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_bank_accounts_on_client_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'middle_name'
    t.string 'client_number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'account_transactions', 'bank_accounts'
  add_foreign_key 'bank_accounts', 'clients'
end
