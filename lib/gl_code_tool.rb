# frozen_string_literal: true

# Tool for mapping accounting categories to their corresponding General Ledger (GL) codes.
# Provides a standardized way to convert expense categories into numerical GL codes
# used in accounting systems for proper financial categorization and reporting.
class GlCodeTool < RubyLLM::Tool
  description 'Maps accounting category to the correct GL code'

  param :category, desc: 'The accounting category to map', type: :string

  CATEGORY_TO_GL = {
    'BANK' => 6800,
    'TRAVEL' => 6600,
    'MEALS' => 6610,
    'SOFTWARE' => 6310,
    'ADVERTISING' => 6300,
    'CONTRACTOR' => 7100,
    'IT' => 7200,
    'INCOME' => 8000,
    'TRANSPORTATION' => 6640,
    'OTHER' => 6999
  }.freeze

  def execute(category:)
    CATEGORY_TO_GL[category] || 6999 # Default fallback GL code
  end
end
