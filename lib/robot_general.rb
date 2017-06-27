require_relative "table"
require_relative "robot"
require "pry"

class RobotGeneral

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def initialize
    puts "Hello I'm the Robot General"
    @table = Table.new
    @robot = Robot.new(@table)
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
    if @initial_command && cmd == "PLACE"
      @initial_command = false
      @robot.place_on_position(x_position.to_i, y_position.to_i, face)
    elsif !@initial_command and valid_command?(cmd)
      case cmd
      when "PLACE"
        @robot.place_on_position(x_position, y_position, face)
      when "MOVE"
        @robot.move
      when "LEFT"
        @robot.rotate("LEFT")
      when "RIGHT"
        @robot.rotate("RIGHT")
      when "REPORT"
        @robot.report
      end
    else
      puts "You have used an invalid command. Please check your syntax and try again."
    end
  end

  private

  def valid_command?(command)
    VALID_COMMANDS.include?(command)
  end
end
