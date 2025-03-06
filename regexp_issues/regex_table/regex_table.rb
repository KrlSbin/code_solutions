class ExtractNullsFromTable
  class << self
    def table_regex
      Regexp.new('(?<=\\n)NULL,[^\\n]*\\n|(?<=\\n)[^\\n]*,NULL,[^\\n]*\\n|(?<=\\n)[^\\n]*,NULL\\n')
    end
    def do(file)
      file.gsub(table_regex, '')
    end
  end
end
