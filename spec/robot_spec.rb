require 'spec_helper'
require './lib/robot'

describe Robot do
  describe "#place_on_position" do
    context "successfully" do
      let(:robot) { described_class.new(double) }
      before do
        allow(robot).to receive(:valid_place_params?).with(Fixnum, Fixnum, String).and_return(true)
      end

      it "sets the position" do
        expect(STDOUT).to receive(:puts).and_return("Robot is now at X:3 Y:3 facing NORTH")
        robot.place_on_position(3,3,"NORTH")
      end
    end

    context "invalid" do
      let(:robot) { described_class.new(double) }
      before do
        allow(robot).to receive(:valid_place_params?).with(Fixnum, Fixnum, String).and_return(true)
      end

      it "sets the position" do
        expect(STDOUT).to receive(:puts).and_return("Robot position/face will be invalid")
        robot.place_on_position(3,3,"NORTH")
      end
    end
  end

  describe "#rotate" do
    let(:robot) { described_class.new(double) }

    before do
      robot.instance_variable_set(:@x_position, 1)
      robot.instance_variable_set(:@y_position, 1)
      robot.instance_variable_set(:@face, "NORTH")
    end

    context "LEFT" do
      it "turns left successfully" do
        expect(STDOUT).to receive(:puts).and_return("Robot is now at X:1 Y:1 facing WEST")
        robot.rotate("LEFT")
      end
    end

    context "RIGHT" do
      it "turns left successfully" do
        expect(STDOUT).to receive(:puts).and_return("Robot is now at X:1 Y:1 facing EAST")
        robot.rotate("RIGHT")
      end
    end
  end

  describe "#calculate_move" do
    let(:robot) { described_class.new(double) }

    before do
      robot.instance_variable_set(:@x_position, 3)
      robot.instance_variable_set(:@y_position, 3)
    end

    context "NORTH" do
      before do
        robot.instance_variable_set(:@face, "NORTH")
      end

      it "moves north" do
        x_result, y_result = robot.calculate_move
        expect(x_result).to eq 3
        expect(y_result).to eq 4
      end
    end

    context "EAST" do
      before do
        robot.instance_variable_set(:@face, "EAST")
      end

      it "moves east" do
        x_result, y_result = robot.calculate_move
        expect(x_result).to eq 4
        expect(y_result).to eq 3
      end
    end

    context "SOUTH" do
      before do
        robot.instance_variable_set(:@face, "SOUTH")
      end

      it "moves south" do
        x_result, y_result = robot.calculate_move
        expect(x_result).to eq 3
        expect(y_result).to eq 2
      end
    end

    context "WEST" do
      before do
        robot.instance_variable_set(:@face, "WEST")
      end

      it "moves west" do
        x_result, y_result = robot.calculate_move
        expect(x_result).to eq 2
        expect(y_result).to eq 3
      end
    end
  end
end
