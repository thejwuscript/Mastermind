module Colors 
  
  LETTERS = ['R', 'O', 'Y', 'G', 'Bl', 'P', 'Br', 'W', '_ '].freeze
  COLORED_PEGS = ['🔴', '🟠', '🟡', '🟢', '🔵', '🟣', '🟤', '⚪', '_ '].freeze

  def to_coloredpegs(array)
    conversion_list = Hash[LETTERS.zip(COLORED_PEGS)]
    array.map { |letter| conversion_list[letter] }
  end
end



#=> {"R"=>"🔴", "O"=>"🟠", "Y"=>"🟡", "G"=>"🟢", "Bl"=>"🔵", "P"=>"🟣", "Br"=>"🟤", "W"=>"⚪"}