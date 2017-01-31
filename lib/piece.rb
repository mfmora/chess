require_relative "board.rb"

class Piece

  attr_accessor :position, :board, :color, :symbol

  def initialize(position, board, color, symbol)
    @position = position
    @board = board
    @color = color
    @symbol = symbol
  end

  def to_s
    symbol
  end


end
