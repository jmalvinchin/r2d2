class Robot
  VALID_FACES = ["NORTH", "EAST", "SOUTH", "WEST"]
  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :face

  def valid_face?(face)
    VALID_FACES.include?(face)
  end

  def move(x, y)
    @x_position = x
    @y_position = y
    report
  end

  def report
    puts "Robot is now at X:#{@x_position} Y:#{@y_position} facing #{@face}"
  end

  def calculate_move
    x_pos = @x_position
    y_pos = @y_position
    case face
    when "NORTH"
      x_pos += 1
    when "EAST"
      y_pos += 1
    when "SOUTH"
      x_pos -= 1
    when "WEST"
      y_pos -= 1
    end

    return x_pos, y_pos
  end
end
