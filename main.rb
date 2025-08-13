# frozen_string_literal: true

require 'dotenv/load'
require 'ruby_llm'
require_relative 'lib/csv_handler'
require_relative 'lib/gl_code_tool'
require_relative 'lib/expense_schema'

# STEP 1: CONFIGURE RUBYLLM
RubyLLM.configure do |config|
  config.openrouter_api_key = ENV.fetch('OPENROUTER_API_KEY')
end

gl_code_tool = GlCodeTool.new

# STEP 2: PROCESS EACH TRANSACTION FROM CSV
puts 'Processing transactions/transactions.csv...'
transactions = CsvHandler.read('transactions/transactions.csv')
enriched_transactions = []

# Process each transaction
transactions.each_with_index do |transaction, index|
  puts "Processing transaction #{index + 1}/#{transactions.length}..."

  # Categorize each transaction
  chat = RubyLLM.chat(model: 'openai/gpt-4.1-mini').with_schema(ExpenseSchema)
  response = chat.ask("Categorize this transaction: #{transaction}")
  categorized_data = response.content

  # Get GL code for the category
  puts "Getting GL code for category: #{categorized_data['category']}..."

  chat_gl = RubyLLM.chat(model: 'openai/gpt-4.1-mini').with_tool(gl_code_tool)
  gl_response = chat_gl.ask("What is the GL Code for the category: #{categorized_data['category']}? Only respond with the code.")
  gl_code = gl_response.content

  # Enrich transaction with GL code
  enriched_transaction = categorized_data.merge('gl_code' => gl_code)
  enriched_transactions << enriched_transaction
end

# Step 3: EXPORT ALL RESULTS TO CSV
puts 'Exporting all results to CSV...'
output_file = 'outputs/enriched_transactions.csv'
CsvHandler.export(enriched_transactions, output_file)
puts "Done! Results saved to #{output_file}"
