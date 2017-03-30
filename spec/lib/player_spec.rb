require "spec_helper"
require "pry"

RSpec.describe Player do
  let(:player) {Player.new("Joe", "red")}
  let(:pieces) {player.pieces}
  let(:updated_pieces) {player.pieces = "foo"}

  describe ".new" do
    it "take a name as an argument" do
      expect(player).to be_a(Player)
    end
    it "take a color as an argument" do
      expect(player).to be_a(Player)
    end
    it "has 21 pieces" do
      expect(pieces).to be_a(Array)
      expect(pieces.empty?).to eq(false)
      expect(pieces.all? { |piece| piece.class == Piece} ).to eq(true)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(player.name).to eq("Joe")
    end
  end
  describe "#color" do
    it "has a reader for color" do
      expect(player.color).to eq("red")
    end
  end
  describe "#pieces" do
    it "has a reader for pieces" do
      expect(player.pieces).to be_a(Array)
    end
  end

  describe "#pieces=" do
    it "has a writer for pieces" do
      expect(updated_pieces).to eq("foo")
    end
  end

end
