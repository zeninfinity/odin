def fibs(num)
  
end

def fibs_rec(num, tot = 0, arr = [])
  if num==0
    puts "The end array is #{arr.sort}"
    return arr
  else
    total=arr[-1] += 1<< num
    fibs_rec(num-1, arr)
    return arr 
  end
end

fibs_rec(5)
