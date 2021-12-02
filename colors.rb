module Colors 
  
  LETTER_OF_COLORS = ['R', 'O', 'Y', 'G', 'Bl', 'P', 'Br', 'W'].freeze
  COLORED_PEGS = ['🔴', '🟠', '🟡', '🟢', '🔵', '🟣', '🟤', '⚪'].freeze

  def to_coloredpegs(array)
    conversion_list = Hash[LETTER_OF_COLORS.zip(COLORED_PEGS)]
    array.map { |letter| conversion_list[letter] }.join(' ')
  end
end



#=> {"R"=>"🔴", "O"=>"🟠", "Y"=>"🟡", "G"=>"🟢", "Bl"=>"🔵", "P"=>"🟣", "Br"=>"🟤", "W"=>"⚪"}