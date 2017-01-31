require_relative 'piece_helper.rb'
require_relative 'nullpiece.rb'
require 'byebug'
class Board

  PIECES_BY_INDEX = {
    0 => [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook],
    1 => [Pawn]*8,
    2 => nil,
    3 => nil,
    4 => nil,
    5 => nil,
    6 => [Pawn]*8,
    7 => [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
  }


  attr_reader :grid
  def initialize
    @grid = make_starting_grid
  end

  def make_starting_grid
    chess = Array.new(8)
    chess.each_index do |index_row|
      chess[index_row] = row_pieces(PIECES_BY_INDEX[index_row],index_row,color_by_index(index_row))
    end
    chess
  end

  def color_by_index(index)
    index < 2 ? :black : :white
  end

  def row_pieces(pieces, index_row, color)
    return Array.new(8){NullPiece.instance} if pieces.nil?

    chess_row = []
    pieces.each_with_index do |piece, index_column|
      chess_row << piece.new([index_row, index_column], self, color)
    end
    chess_row
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x, y = pos
    @grid[x][y] = value
  end

  def in_bounds?(pos)
    x, y = pos
    x < 8 && y < 8 &&
    x >= 0 && y >= 0
  end

  def move_piece(start_pos,end_pos)

    unless in_bounds?(start_pos) && in_bounds?(end_pos)
      raise ArgumentError.new("one of those spaces isn't on the grid!")
    end
    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError.new("no piece in the start position")
    end

    unless self[start_pos].moves.include?(end_pos)
      raise ArgumentError.new("You can't move your piece to that position")
    end

    piece = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = piece
    piece.position = end_pos

  rescue ArgumentError => e
    puts "#{e.message}\n"
    sleep(1)
  rescue NoMethodError => e
    puts "Invalid input\n"
    sleep(1)
  end

  def prompt_user
    puts "Which piece should I move"
    start_pos = gets.chomp.split(",").map(&:to_i)
    puts "Where should I put it"
    end_pos = gets.chomp.split(",").map(&:to_i)
    move_piece(start_pos,end_pos)
  rescue ArgumentError => e
    puts "#{e.message}\n"
    retry
  rescue NoMethodError => e
    puts "Invalid input\n"
    retry
  end

  def get_all_pieces(color)
    @grid.select {|piece| piece.color == color}
  end

  def find_piece(class_name,color)
    @grid.select {|piece| piece.color == color && piece.is_a?(class_name)}
  end

  def opposite_color(color)
    color == :white ? :black : :white
  end

  def in_check?(color)
    king = find_piece(King,color)

    get_all_pieces(opposite_color(color)).each do |piece|
      return true if piece.moves.include?(king.position)
    end
    false
  end

  def checkmate?(color)
    in_check?(color) && valid_moves.nil? #to be implemented
  end
end
