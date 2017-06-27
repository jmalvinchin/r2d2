require 'spec_helper'
require './lib/table'

describe Table do
  describe "#within_table_bounds" do
    let(:table) { described_class.new }

    it "is passing" do
      result = table.within_table_bounds(3,3)
      expect(result).to eq true
    end

    it "is failing" do
      result = table.within_table_bounds(6,3)
      expect(result).to eq false
    end
  end
end
