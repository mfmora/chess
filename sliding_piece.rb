module SlidingPiece

  DIRECTIONS = {
    :diagonal => [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
    ],
    :horizontal_vertical =>
    [
      [0,1],
      [0,-1],
      [1,0],
      [-1,0]
    ],
    :both => [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
      [0,1],
      [0,-1],
      [1,0],
      [-1,0]
    ]
  }

  def moves
    positions = []

    DIRECTIONS[move_dirs].each do |diff|
      x_diff, y_diff = diff
      x, y = position
      new_position = [x_diff + x, y_diff + y]

      # wall or piece of other color | stop in piece of different color
      while @board.in_bounds?(new_position) && @board[new_position].color != color
        positions << new_position
        old_x, old_y = new_position
        new_position = [x_diff + old_x, y_diff + old_y]
      end

      #if @board[new_position].color != 

    end

    positions.reject {|pos| @board[pos].color == self.color}
  end
end
