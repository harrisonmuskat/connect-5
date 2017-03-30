require "spec_helper"

RSpec.describe Piece do
  let(:piece) { Piece.new("red") }

  describe ".new" do
    it "takes a color as an argument" do
      expect(piece).to be_a(Piece)
    end
  end

  describe "#color" do
    it "has a reader for color" do
      expect(piece.color).to eq("red")
    end
  end
end
