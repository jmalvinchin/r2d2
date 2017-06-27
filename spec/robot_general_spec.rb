require 'spec_helper'
require './lib/robot_general'

describe RobotGeneral do
  describe "#initialize" do
    it "should successfully initialize Table and Robot" do
      expect(Table).to receive(:new)
      expect(Robot).to receive(:new)
      expect(STDOUT).to receive(:puts).with("Hello I'm the Robot General")

      robot_general_instance = described_class.new
      expect(robot_general_instance.instance_variable_get(:@initial_command)).to eq true
    end
  end

  describe "#execute_command" do
    context "initial_command" do
      let(:robot_general) { described_class.new }

      it "should successfully call the place_robot function" do
        expect(STDOUT).to receive(:puts).with("Hello I'm the Robot General")
        expect(STDOUT).to receive(:puts).with("Robot is now at X:1 Y:1 facing NORTH")
        robot_general.execute_command("PLACE 1,1,NORTH")
      end

      it "should provide an error message if it's not a PLACE command" do
        expect(STDOUT).to receive(:puts).with("Hello I'm the Robot General")
        expect(STDOUT).to receive(:puts).with("You have used an invalid command. Please check your syntax and try again.")
        robot_general.execute_command("MOVE")
      end

      it "should provide an invalid position message if place position is invalid "\
          "and initial command still needs to a valid place command" do
        expect(STDOUT).to receive(:puts).with("Hello I'm the Robot General")
        expect(STDOUT).to receive(:puts).with("Robot position/face will be invalid")
        robot_general.execute_command("PLACE 6,6,NORTH")

        expect(STDOUT).to receive(:puts).with("You have used an invalid command. Please check your syntax and try again.")
        robot_general.execute_command("MOVE")
      end
    end
  end
end
