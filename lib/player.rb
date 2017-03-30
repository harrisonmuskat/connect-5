class Player
  attr_reader :name, :color
  attr_accessor :pieces
  def initialize(name, color)
    @name= name
    @color= color
    @pieces= create_pieces_array
  end

  def create_pieces_array
    pieces= []
    21.times do
      pieces << Piece.new(@color)
    end
    pieces
  end
end
