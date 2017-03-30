require_relative "./piece"
require "colorize"

class Board
  attr_reader :grid

  def initialize
    @grid= Array.new(6) {Array.new(7)}
  end


  def print_board
    output= ""
    @grid.each do |row|
      row.each do |space|
        if space.nil?
          output+= "[ ]"
        else
          if space.color == "red"
            output += "[o]".colorize(:red)
          else
            output += "[o]".colorize(:blue)
          end
        end
      end
      output+= "\n"
    end
    output
  end

  def space_is_empty?(row, column)
    @grid[row][column].nil?
  end

  def drop_piece(column, piece)
    index = 5
    @grid.reverse.each do |row|

      if self.space_is_empty?(index, column)
        return @grid[index][column] = piece
      end
      index-= 1
    end
    raise ColumnFullError
  end

end
