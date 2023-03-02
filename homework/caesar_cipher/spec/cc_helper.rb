require_relative '../cc.rb'
describe "#caesar_cipher" do
  it "Returns correct reversed string" do
    expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
  end

  it "Returns correct reversed string from before" do
    expect(caesar_cipher("Bmfy f xywnsl!", 21)).to eql("What a string!")
  end
end
