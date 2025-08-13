# frozen_string_literal: true

require 'ruby_llm/schema'

# Schema for enriching financial transactions
class ExpenseSchema < RubyLLM::Schema
  string :date, description: 'Transaction date', required: true
  string :description, description: 'Transaction description', required: true
  string :amount, description: 'Transaction amount as a string (e.g. "-$12.50")', required: true
  string :type, description: 'Transaction type: "Expense" or "Income"', required: true
  string :notes, description: 'Brief explanation of the transaction', required: true
  string :category, description: 'Business category. It falls into one of these buckets: ' \
                                'BANK, TRAVEL, MEALS, SOFTWARE, ' \
                                'ADVERTISING, CONTRACTOR, ' \
                                'IT, INCOME, TRANSPORTATION, OTHER', required: true
end
