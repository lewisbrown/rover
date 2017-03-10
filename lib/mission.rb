require_relative 'rover'

module MarsRover
  class Mission

    attr_accessor :plateau
#    attr_accessor :position, :direction, :commands
    attr_accessor :rover_configs

    def initialize(stdin=STDIN)
      @input = stdin
      @rover_configs = []
      @rover_results = []
    end

    def process
      set_plateau
      while !@input.eof?
        @rover_results << Rover.new(*read_rover_config).do_commands
      end
    end

    def read_rover_config
      [read_position_and_direction, read_commands, @plateau]
    end

    def read_plateau
      @input.gets.chomp.split.map(&:to_i)
    end

    def set_plateau
      @plateau = read_plateau
    end

    def read_position_and_direction
      *position, direction = @input.gets.chomp.split
      [position.map(&:to_i), direction.to_sym]
    end

    def read_commands
      @input.gets.chomp.split('').map(&:to_sym)
    end
  end

end
