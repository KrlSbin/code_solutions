class Result
  attr_reader :data

  def initialize
    raise "Provide both files or none" if [ARGV[0].nil?, ARGV[1].nil?].one?
    @origin = FileHandling.new(ARGV[0] || :origin)
    @expected = FileHandling.new(ARGV[1] || :expected)
    @data = DataGenerator.new
  end

  def actual
    if @origin.file_data?
      @actual ||= ExtractNullsFromTable.do(@origin.file_data)
    else
      data.make!
      @origin.write_to_file(data.for_origin)
      @actual ||= ExtractNullsFromTable.do(@origin.file_data)
    end
  end

  def expected
    if @expected.file_data?
      @expected.file_data
    else
      @expected.write_to_file(data.for_expected)
      @expected.file_data
    end
  end
end
