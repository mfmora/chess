module SteppingPiece

  KNIGHT_MOVES = [
    [1,2],
    [1,-2],
    [-1,2],
    [-1,-2],
    [2,1],
    [2,-1],
    [-2,1],
    [-2,-1]
  ]

  KING_MOVES = [
    [1,0],
    [1,1],
    [1,-1],
    [-1,0],
    [-1,1],
    [-1,-1],
    [0,1],
    [0,-1]
  ]

  def moves
    positions = []

    array = self.is_a?(Knight) ? KNIGHT_MOVES : KING_MOVES

    array.each do |diff|
      x_diff, y_diff = diff
      x, y = self.position
      new_position = [x_diff + x, y_diff + y]
      
      if @board.in_bounds?(new_position) && different_color(new_position)
        positions << new_position
      end
    end

    positions.reject {|pos| @board[pos].color == self.color}
  end
end
