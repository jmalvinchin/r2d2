class Robot
  VALID_FACES = ["NORTH", "SOUTH", "EAST", "WEST"]
  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :face

  def valid_face?(face)
    VALID_FACES.include?(face)
  end
end
