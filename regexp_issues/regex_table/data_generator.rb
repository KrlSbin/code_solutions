class DataGenerator
  module CONST
    NOT_CAPTURED_NULLS = %w(null Null NUll NULl nULL nuLL nulL NULLIFY ANNULL)
    CAPTURED_NULL = 'NULL'
  end

  def initialize
    @cleaned_arr = []
  end

  def for_origin
    file_header + file_body(@dirty_arr) + "\n"
  end

  def for_expected
    file_header + file_body(@cleaned_arr) + "\n"
  end

  def make!
    generate_initial_arr! if @initial_arr.nil?
    mixin_nulls! if @dirty_arr.nil? || @cleaned_arr.empty?
  end

  private

  def mixin_nulls!
    @dirty_arr ||= @initial_arr.each do |sub|
      if rand(4) % (rand(3) + 1) == 0
        sub[rand(4)] = CONST::CAPTURED_NULL
      else
        @cleaned_arr.push(sub)
      end
    end
  end

  def generate_initial_arr!
    @initial_arr ||=
      begin
        temp_names = (generate_names + CONST::NOT_CAPTURED_NULLS * 100).shuffle

        temp_names.map.with_index do |name, index|
          [
            index + 1,
            name,
            generate_ages,
            generate_scores
          ]
        end
      end
  end

  def file_header
    "id,name,age,score\n"
  end

  def file_body(arr)
    arr.map { |el| el.join(',') }.join("\n").to_s
  end

  def generate_names
    @generated_names ||= ('a'..'z').to_a.combination(4).map(&:join)
  end

  def generate_ages
    rand(100)
  end

  def generate_scores
    (rand * 100).round(2)
  end
end
