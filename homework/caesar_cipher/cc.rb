def caesar_cipher(string, shift)
  alpha26 = ("a".."z").to_a
  newline = ""
  #puts "letter newposition upper newlet "
  string.split('').each do |letter| 
    if letter.match?(/[[:alpha:]]/)
      upper = (letter == letter.upcase)
      position=(alpha26.index(letter.downcase))+shift
      if position > 25 then position = position-26 end 
      newlet = alpha26[position]
      # puts "#{letter} #{position} #{upper} #{newlet}"
      #if upper 
      !upper ? newline+=newlet : newline+=newlet.upcase
		else
      newline+=letter
		end
  end
  return newline
end

#puts caesar_cipher("What a string!", 5)
