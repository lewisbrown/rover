require 'mission'
require 'stringio'

RSpec.describe Mission do

  it 'parses a string for plateau size' do
    mission = Mission.new StringIO.new("5 5\n")
    
    expect(mission.read_plateau).to eq [5, 5]
  end

    
  it 'parses a string for position & direction' do
    mission = Mission.new StringIO.new("1 2 N\n")
    
    expect(mission.read_position).to eq [[1, 2], :N]
  end
    
  it 'parses a string for movement commands' do
    mission = Mission.new StringIO.new("LMLMLMLMM\n")

    expect(mission.read_commands).to eq [:L, :M, :L, :M, :L, :M, :L, :M, :M]
  end

  context "full procedure", order: :defined do
    fullmission = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n"
    mission = Mission.new StringIO.new(fullmission)

    it 'proccess input' do
      skip
    end


    it "initializes plateau" do
      mission.set_plateau
      expect(mission.plateau).to eq [5,5]
    end

    it "returns next rover config" do
      expect(mission.get_next_rover_config).to eq [[1, 2], :N, [5, 5]]
    end

    it "is loaded with movement commands" do
      expect(mission.commands).to eq [:L, :M, :L, :M, :L, :M, :L, :M, :M]
    end
  end

end
