class Game

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @display = Display.new(@board)
  end
end
