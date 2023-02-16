#  > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#  => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#  > substrings("below", dictionary)
#  => { "below" => 1, "low" => 1 }

def substrings(string, dictionary)
matches = Hash.new(0)
  
  # For each word downcased, remove punctuation)
  string.downcase.gsub(/[^a-z ]/, '').split.each do | wd | 
    # Check if in dictionary
    dictionary.each do |dic|
      if wd.include?(dic) 
        matches[dic] += 1
      end 
    end
    
  end 
matches
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
