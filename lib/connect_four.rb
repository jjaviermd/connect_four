class Board

  attr_reader :board, :player_w, :player_b
  attr_writer :turns
  attr_accessor :played_boxes, :player
  def initialize
    @board = [
      %w[01 02 03 04 05 06 07], 
      %w[08 09 10 11 12 13 14],
      %w[15 16 17 18 19 20 21], 
      %w[22 23 24 25 26 27 28], 
      %w[29 30 31 32 33 34 35], 
      %w[36 37 38 39 40 41 42]
    ]
    @player_w = "\u26AA".unicode_normalize!
    @player_b = "\u26D4".unicode_normalize!
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

  def cell_select
    puts "sellect a cell between 1 a 42"
    i = gets.chomp.to_i
    i.between?(1, 42) ? i : cell_select
    self.valid_move?(i) ? i : cell_select
  end

  def valid_move?(i)
    return true unless @played_boxes.include?(i)
    return false
  end

  def make_move(i)
    board[0][i-1] = player if i.between?(1, 7)
    board[1][i-8] = player if i.between?(8, 14)
    board[2][i-15] = player if i.between?(15, 21)
    board[3][i-22] = player if i.between?(22, 28)
    board[4][i-29] = player if i.between?(29, 35)
    board[5][i-36] = player if i.between?(36, 42)
  end

  def switch_player
    if self.player == player_w
      self.player = player_b
    else self.player = player_w
    end
  end

end

b = Board.new
b.played_boxes.push(5)
b.cell_select