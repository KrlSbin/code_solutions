require_relative './extract_nulls_from_table'
require_relative './file_handling'
require_relative './data_generator'
require_relative './result'

require 'minitest/autorun'

class Prepare
  class << self
    def actual; result.actual; end

    def expected; result.expected; end

    private def result; @result ||= Result.new;
    end
  end
end

class RegexTableMinitest < Minitest::Test
  def setup
    @actual = Prepare.actual
    @expected = Prepare.expected
  end

  def test_result
    assert_equal(@actual, @expected)
  end
end
