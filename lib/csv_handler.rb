# frozen_string_literal: true

require 'csv'

# Handles CSV import and export operations
class CsvHandler
  def self.export(rows, output_file)
    return if rows.nil? || rows.empty?

    headers = rows.first&.keys || []

    CSV.open(output_file, 'w', write_headers: true, headers: headers) do |csv|
      rows.each { |row| csv << headers.map { |h| row[h] } }
    end
  end

  def self.read(file_path)
    rows = CSV.read(file_path, headers: true).map(&:to_h)
    rows.reject { |row| row.values.compact.empty? || row.values.all?(&:nil?) }
  end
end
