class GeneratedData
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
    @initial_arr ||= ('a'..'z').to_a.combination(4).map { |el| el.join.capitalize }
                               .push(*CONST::NOT_CAPTURED_NULLS * 100)
                               .shuffle
                               .map
                               .with_index do |el, i|
      [
        i + 1,
        el,
        (rand() * 100).to_i,
        (rand() * 100).round(2)
      ]
    end
  end

  def file_header
    "id,name,age,score\n"
  end

  def file_body(arr)
    arr.map { |el| el.join(',') }.join("\n").to_s
  end
end
