require 'helpers'
#require 'rover'

RSpec.describe 'Constantize' do
  
  using Constantize
  
  CONST = 3

  class Rover
    N = 0
  end
  
  it "will convert string to local constant" do
    expect("CONST".constantize(self)).to eq 3
  end

  it "will convert symbol to foreign constant" do
    expect(:N.constantize(Rover)).to eq 0
  end
end

RSpec.describe 'Membership' do

  using Membership

  let(:a) {[1, 3, 5, 7]}

  it "tests true for membership" do
    expect(1.member?(a)).to be_truthy
  end

  it "test false for non-membership" do
    expect(2.member?(a)).to be_falsy
  end
end

