class ExtractNullsFromTable
  # EXTRACT_NULLS_REGEXP = Regexp.new('(?<=\\n)NULL,[^\\n]*\\n|(?<=\\n)[^\\n]*,NULL,[^\\n]*\\n|(?<=\\n)[^\\n]*,NULL\\n')
  EXTRACT_NULLS_REGEXP = Regexp.new('^.*\bNULL\b.*\\n')
  class << self
    def do(file)
      file.gsub(EXTRACT_NULLS_REGEXP, '')
    end
  end
end
