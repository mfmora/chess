require_relative "piece.rb"


class Pawn < Piece

  def initialize(position, board, color)
    super(position,board,color,set_symbol(color))
  end

  def set_symbol(color)
    color == :white ? "\u{2659}" : "\u{265F}"
  end

  def moves
    positions = []
    x, y = position
    diagonal_moves.each do |diff_x,diff_y|
      new_pos = [x + diff_x, y + diff_y]
      positions << new_pos if opponent_piece?(new_pos)
    end
    vertical_moves.each do |diff_x,diff_y|
      new_pos = [x + diff_x, y + diff_y]
      positions << new_pos if @board.empty_space?(new_pos)
    end
    positions
  end

  def diagonal_moves
    color == :black ? [[1,-1],[1,1]] : [[-1,-1],[-1,1]]
  end

  def vertical_moves
    moves = [simple_step]
    moves << double_step if original_row == position[0]
    moves
  end

  def simple_step
    color == :black ? [1,0] : [-1,0]
  end

  def double_step
    color == :black ? [2,0] : [-2,0]
  end

  def original_row
    color == :black ? 1 : 6
  end
end
