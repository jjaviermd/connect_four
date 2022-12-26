class Board

  attr_reader :board, :player_a, :player_b, :player
  attr_writer :player, :turns
  def initialize
    @board = [
      %w[01 02 03 04 05 06 07], 
      %w[08 09 10 11 12 13 14],
      %w[15 16 17 18 19 20 21], 
      %w[21 22 23 24 25 26 27], 
      %w[28 29 30 31 32 33 34], 
      %w[35 36 37 38 39 40 41]
    ]
    @player_w = "\u26AA".unicode_normalize!
    @player_b = "\u25AB".unicode_normalize!
    @player = player_w
    @turns = 0
    @played_boxes = Array.new
  end

  def print_board
    board.each do |row| 
      puts row.join("|")
      puts "++++++++++++++++++++"
    end
   end

end

board = Board.new
board.print_board
