def bubble_sort(arr)
  sorts=0
  while 
    for i in 0 .. arr.size-1
      if arr[i+1] && arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorts+=1
      end
    end
    if !arr[i+1]
      if sorts == 0 
        return arr
      else
        sorts=0
      end
    end
  end
end

#first iteration
#second n-1 (ie you don't need to look at the last variable as it will be the highest number
p bubble_sort([4,3,78,2,0,2])