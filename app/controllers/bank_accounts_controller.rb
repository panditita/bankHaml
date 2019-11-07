# frozen_string_literal: true

class BankAccountsController < ApplicationController
  def index
    @bank_accounts = BankAccount.all
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end
end
