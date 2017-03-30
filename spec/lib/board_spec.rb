require "spec_helper"

RSpec.describe Board do
  let(:board) { Board.new}


  describe ".new" do
    it "is a board" do
      expect(board).to be_a(Board)
    end
    it "is a grid" do
      expect(board.grid.length).to eq(6)
      expect(board.grid[0].length).to eq(7)
    end
  end

  describe "#print_board" do
    it "prints a row of spaces" do
      expect(board.print_board).to include("[ ][ ][ ][ ][ ][ ][ ]\n")
    end
    it "prints a board with pieces in it" do
      board.drop_piece(6, Piece.new("red"))
      expect(board.print_board).to include("[ ][ ][ ][ ][ ][ ][o]\n")
    end
  end

  describe "#space_is_empty?" do
    it "returns true if the specified space is empty" do
      expect(board.space_is_empty?(0,0)).to eq(true)
    end
    it "returns false if the specified space is not empty" do
      board.drop_piece(6, Piece.new("red"))
      expect(board.space_is_empty?(5,6)).to eq(false)
    end
  end

  describe "#drop_piece" do

    it "adds a piece to the lowest available empty spot in the provided column" do
      board.drop_piece(6, Piece.new("red"))
      expect(board.space_is_empty?(5,6)).to eq(false)
      expect(board.grid[5][6].color).to eq("red")


    end
    it "throws At Capacity error if collumn is full" do
      6.times do
        board.drop_piece(6, Piece.new("red"))
      end
    expect{board.drop_piece(6, Piece.new("red"))}.to raise_error(ColumnFullError)
    end

  end



end
