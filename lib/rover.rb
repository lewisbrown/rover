class Object
  def member(enumerable)
    enumerable.include? self
  end
end

class Rover

  attr_accessor :position_x
  attr_accessor :position_y

  attr_accessor :direction
  
  attr_accessor :plateau_x
  attr_accessor :plateau_y

  DIRECTIONS = [:N, :S, :E, :W]

  def initialize(position: [0,0], direction: :N, plateau: [0,0])
    assert direction.member(DIRECTIONS), "invalid direction"

    @position_x = position[0]
    @position_y = position[1]

    @direction = direction

    @plateau_x = plateau[0]
    @plateau_y = plateau[1]
  end

  def move
    send @direction
  end

  def N
    @position_y += 1 unless n_bound
  end

  def S
    @position_y -= 1 unless s_bound
  end

  def n_bound
    @position_y == @plateau_y
  end

  def s_bound
    @position_y == 0
  end


  def assert(value, message="Assertion failed")
    raise Exception, message, caller unless value
  end

end
