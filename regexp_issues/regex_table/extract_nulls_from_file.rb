require_relative './extract_nulls_from_table'
class ExtractNullsFromFile
  def self.handle_file(path)
    File.write('extracted.csv', File.read(path).gsub(ExtractNullsFromTable::EXTRACT_NULLS_REGEXP, ''))
  end
end

raise "Please provide file" if ARGV[0].nil?
ExtractNullsFromFile.handle_file(ARGV[0])
