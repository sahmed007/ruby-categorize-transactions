# Categorizing Transactions with RubyLLM

A practical real-world example of automatically categorizing and enriching financial transactions using AI with RubyLLM.

This repository contains a real world example of how to use RubyLLM to process transactions, categorize them by viewing their descriptions, look up the GL code for each category using a tool, and export the results to a CSV file.

## Installation

Clone the repo and run `bundle install` to install dependencies.

```bash
bundle install
```

## Usage

These examples use OpenRouter API for LLM calls. You will need to set up an OpenRouter API key by creating a `.env` file using the `.env.example` as a template.

If you would like to use a different LLM provider, you can modify the configuration in the `main.rb` file to use a different LLM provider along with the model of your choice as well. In this example, the `openai/gpt-4.1-mini` model is used.

The LLM calls are made using the [RubyLLM](https://github.com/crmne/ruby_llm) gem. To see the complete list of models, you can go [here](https://rubyllm.com/guides/available-models).

Simply run with `ruby main.rb` to see the results.

## Contributing

Pull requests are always welcome.

## License

[MIT](https://choosealicense.com/licenses/mit/)