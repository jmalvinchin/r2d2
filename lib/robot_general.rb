require_relative "table"
require_relative "robot"
require "pry"

class RobotGeneral

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def initialize
    puts "Hello I'm the Robot General"
    @table = Table.new
    @robot = Robot.new
    @initial_command = true
  end

  def hello_message
    puts "Hi Hello, you may now order around your robot"
  end

  def input_commands
    loop do
      puts "Please Enter a command:"
      @command = gets.chomp
      execute_command(@command)
    end
  end

  def execute_command(command)
    cmd, cmd_params = command.split(" ")
    x_position, y_position, face = cmd_params.split(",") if cmd_params
    if @initial_command && cmd == "PLACE" && valid_place_params?(x_position, y_position, face)
      @initial_command = false
      place_robot(x_position, y_position , face)
    elsif !@initial_command and valid_command?(cmd)
      case cmd
      when "PLACE"
        place_robot(x_position, y_position , face) if valid_place_params?(x_position, y_position, face)
      when "MOVE"
        puts "MOVE +1"
      when "LEFT"
        puts "change the direction the robot is facing to its LEFT"
      when "RIGHT"
        puts "change the direction the robot is facing to its RIGHT"
      when "REPORT"
        puts "output the x,y and direction of robot"
      end
    else
      puts "You have used an invalid command. Please check your syntax and try again."
    end
  end

  def place_robot(x_position, y_position, face)
    @robot.x_position = x_position.to_i
    @robot.y_position = y_position.to_i
    @robot.face = face
    puts "Your robot is now at X:#{x_position} Y:#{y_position} facing #{face}"
  end

  private

  def valid_place_params?(x_position, y_position, face)
    @table.within_x_range(x_position) &&
      @table.within_y_range(y_position) &&
      @robot.valid_face?(face)
  end

  def valid_command?(command)
    VALID_COMMANDS.include?(command)
  end
end