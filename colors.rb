# frozen_string_literal: true

module Colors
  LETTERS = %w[R O Y G BL P BR W].freeze
  COLORED_PEGS = ['🔴', '🟠', '🟡', '🟢', '🔵', '🟣', '🟤', '⚪'].freeze

  def to_coloredpegs(array)
    conversion_list = Hash[LETTERS.zip(COLORED_PEGS)]
    array.map do |letter|
      if letter == '_ '
        '_ '
      else
        conversion_list[letter]
      end
    end
  end
end

#=> {"R"=>"🔴", "O"=>"🟠", "Y"=>"🟡", "G"=>"🟢", "Bl"=>"🔵", "P"=>"🟣", "Br"=>"🟤", "W"=>"⚪"}
