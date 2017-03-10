require_relative 'helpers'

module MarsRover
  class Rover

    using Membership
    using Constantize

    Directions = Hash[:N, 0, :E, 1, :S, 2, :W, 3]
    Directions.merge! Directions.invert
    Directions.compare_by_identity

    Commands = [:R, :L, :M]

    attr_accessor :position_x, :position_y
    attr_accessor :direction
    attr_accessor :plateau_x,:plateau_y
    attr_accessor :commands

    def initialize(position, direction, commands, plateau)
      validate_direction direction
      validate_plateau plateau
      validate_position position, plateau
      validate_commands commands

      @position_x = position[0]
      @position_y = position[1]

      @direction = direction

      @commands = commands

      @plateau_x = plateau[0]
      @plateau_y = plateau[1]
    end

    def to_s
      "#{@position_x} #{@position_y} #{@direction}"
    end

    alias status to_s

    def do_commands
      @commands.each do |c|
        send c
      end
      self
    end

    def turn_left
      @direction = Directions[(Directions[@direction] - 1)%4]
    end

    def turn_right
      @direction = Directions[(Directions[@direction] + 1)%4]
    end

    alias L turn_left
    alias R turn_right

    def move
      send @direction
    end

    alias M move

    def N
      @position_y += 1 unless n_bound
    end

    def S
      @position_y -= 1 unless s_bound
    end

    def E
      @position_x += 1 unless e_bound
    end

    def W
      @position_x -= 1 unless w_bound
    end

    def n_bound
      @position_y == @plateau_y
    end

    def s_bound
      @position_y == 0
    end

    def e_bound
      @position_x == @plateau_x
    end

    def w_bound
      @position_x == 0
    end

    def validate_position(position, plateau)
      assert position.each_with_index {|p, i| p.member? (0..plateau[i])},
        "invalid position"
    end

    def validate_plateau(plateau)
      assert plateau.all? {|v| v >= 0}, "invalid plateau" 
    end

    def validate_commands(commands)
      assert commands.all? {|c| c.member?(Commands)}, "invalid command(s)"
    end

    def validate_direction(direction)
      assert direction.member?(Directions), "invalid direction"
    end
  end

end
