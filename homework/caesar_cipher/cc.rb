def caesar_cipher(string, shift)
  alpha26 = ("a".."z").to_a
  newline = ""
  #puts "letter newposition upper newlet "
  string.split('').each do |letter| 
    if letter.match?(/[[:alpha:]]/)
      upper = (letter == letter.upcase)
      position=(alpha26.index(letter.downcase))+5
      if position > 25 then position = position-26 end 
      newlet = alpha26[position]
      # puts "#{letter} #{position} #{upper} #{newlet}"
      #if upper 
      !upper ? newline+=newlet : newline+=newlet.upcase
		else
      newline+=letter
		end
  end
  p newline
end

puts caesar_cipher("What a string!", 5)

