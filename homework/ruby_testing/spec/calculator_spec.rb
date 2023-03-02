#spec/calculator_spec.rb
require './lib/calculator'  #=> add this

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
   
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "returns the product of two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(5, 2)).to eql(10)
    end
   
    it "returns the product of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5, 7)).to eql(70)
    end
  end

  describe "#subtract" do
    it "returns the subtraction of two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(5, 2)).to eql(3)
    end
   
    it "returns the subtraction of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(2, 5, 7)).to eql(-10)
    end
  end

  describe "#divide" do
    it "returns the division of two numbers" do
      calculator = Calculator.new
      expect(calculator.divide(9, 3)).to eql(3)
    end
   
    it "returns the division of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.divide(484, 2, 11)).to eql(22)
    end
  end
end
