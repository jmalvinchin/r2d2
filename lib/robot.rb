class Robot
  VALID_FACES = ["NORTH", "EAST", "SOUTH", "WEST"]
  FACE_DIRECTIONS = { "NORTH" => 1, "EAST" => 2, "SOUTH" => 3, "WEST" => 4 }
  TURN_DIRECTIONS = { "LEFT" => -1, "RIGHT" => 1 }
  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :face

  def initialize(table)
    @table = table
  end

  def valid_face?(face)
    VALID_FACES.include?(face)
  end

  def place_on_position(x, y, *face)
    if valid_place_params?(x, y, face[0])
      @x_position = x
      @y_position = y
      @face = face[0] if face.any?
      report
    else
      puts "Robot position/face will be invalid"
    end
  end

  # Visualize as a map with values assigned to face, then directions will just move the value
  # 1 to the right or -1 to the left. The % function will bring it back within the range of the face values.
  # 0 values will be assigned to the WEST since I started with 1 as the North. so 1 = North - 1 LEFT % 4 = 0 which
  # is WEST. 3 = SOUTH + 1 RIGHT % 4 = 0 si also WEST
  def rotate(turn)
    face_value = (FACE_DIRECTIONS[@face] + TURN_DIRECTIONS[turn]) % FACE_DIRECTIONS.length
    if face_value == 0
      @face = FACE_DIRECTIONS.key(4)
    else
      @face = FACE_DIRECTIONS.key(face_value)
    end
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
      y_pos += 1
    when "EAST"
      x_pos += 1
    when "SOUTH"
      y_pos -= 1
    when "WEST"
      x_pos -= 1
    end

    return x_pos, y_pos
  end

  def valid_place_params?(x_position, y_position, face)
    @table.within_table_bounds(x_position, y_position) && valid_face?(face)
  end
end
