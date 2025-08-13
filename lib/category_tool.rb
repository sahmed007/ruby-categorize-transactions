# frozen_string_literal: true

# Tool for mapping accounting categories to their descriptive names.
# Provides a standardized way to convert expense categories into human-readable
# category descriptions for better reporting and user interface display.
class CategoryTool < RubyLLM::Tool
  description 'Maps accounting category to the correct GL code'

  param :category, desc: 'The accounting category to map', type: :string

  CATEGORY_TO_GL = {
    'BANK' => 'Bank & Credit Card Fees', # Bank & Credit Card Fees
    'TRAVEL' => 'Travel', # Travel
    'MEALS' => 'Meals & Entertainment' # Meals & Entertainment
  }

  def execute(category:)
    CATEGORY_TO_GL[category] || 'Other' # Default fallback GL code
  end
end
