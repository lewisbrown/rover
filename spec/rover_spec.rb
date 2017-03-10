require 'rover'

module MarsRover
  RSpec.describe 'Rover' do
    it "exists" do
      r = Rover.new
      expect(r.class).to eq Rover
    end

    context "initialized rover" do
      let(:r) { Rover.new(position: [1,2], 
                          direction: :N, 
                          commands: [:L, :M, :L, :M, :L, :M, :L, :M, :M],
                          plateau: [5,5]) }

      it "has a plateau of x,y size" do
        expect(r.plateau_x).to eq 5
        expect(r.plateau_y).to eq 5
      end

      it "has a position: x,y" do
        expect(r.position_x).to eq 1
        expect(r.position_y).to eq 2
      end

      it "has a direction" do
        expect(r.direction).to eq :N
      end

      it "has commands" do
        expect(r.commands).to eq [:L, :M, :L, :M, :L, :M, :L, :M, :M]
      end

      it 'can move' do
        r.move
        expect(r.position_y).to eq 3
      end

      it 'can turn left' do
        r.L
        expect(r.direction).to eq :W
      end

      it 'can turn right' do
        r.R
        expect(r.direction).to eq :E
      end

      it 'can report its status' do
        expect(r.status).to eq '1 2 N'
      end

      it 'can follow commands' do
        r.do_commands
        expect(r.status).to eq '1 3 N'
      end

      it 'will stay on plateau' do
        r.position_x = 1
        r.position_y = 5
        r.commands = [:M, :M, :M, :M, :M, :M, :M, :M, :M]
        r.do_commands
        expect(r.status).to eq '1 5 N'
      end
    end
  end

end
