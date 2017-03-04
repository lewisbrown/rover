require 'rover'

RSpec.describe 'Rover' do

  
  it "exists" do
    r = Rover.new
    expect(r.class).to eq Rover
  end


  context "initialized rover" do
    let(:r) { Rover.new(position: [3,4], direction: :S, plateau: [4,6]) }

    it "has a plateau of x,y size" do
      expect(r.plateau_x).to eq 4
      expect(r.plateau_y).to eq 6
    end

    it "has a position: x,y" do
      expect(r.position_x).to eq 3
      expect(r.position_y).to eq 4
    end

    it "has a direction" do
      expect(r.direction).to eq :S
    end

    it 'can move' do
      r.move
      expect(r.position_y).to eq 3
    end
  end
  
  
end
