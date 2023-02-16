class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  public
  def display_balance(pin_number)
    if pin_number == @pin 
      puts "Balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, amount)
    if  pin_number == @pin 
      @balance -= amount
      puts "Withdrew #{amount}."
    else
      puts pin_error
    end
  end 

  def deposit(pin_number, amount)
    if  pin_number == pin 
      @balance += amount
      puts "Withdrew #{amount}."
    else
      puts pin_error
    end
  end 

  private
  def pin
    @pin = 1234
  end
  
  def pin_error
    return "Access denied: incorrect PIN."
  end
end

checking_account=Account.new("ZZ", 1_000_000)
checking_account.deposit(1234, 22)
checking_account.display_balance(1234)
checking_account.deposit(1235, 22)
checking_account.display_balance(1234)

