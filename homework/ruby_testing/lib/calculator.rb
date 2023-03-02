class Calculator
  def add(*args)
    args.sum
  end

  def multiply(*args)
    args.inject(:*)
  end

  def subtract(*args)
    total=0
    args.each_with_index do |num, index|
      if index == 0
        total=num
      else
        total=total - num
      end
    end
    return total
  end

  def divide(*args)
    total=0
    args.each_with_index do |num, index|
      if index == 0
        total=num
      else
        total = total / num
      end
    end
    return total
  end
end
