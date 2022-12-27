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
    @win_hands = [
      board[2][0],
      board[0][1..4],
      board[0][2..5],
      board[0][3..6],
      board[1][0..3],
      board[1][1..4],
      board[1][2..5],
      board[1][3..6],
      board[2][0..3],
      board[2][1..4],
      board[2][2..5],
      board[2][3..6],
      board[3][0..3],
      board[3][1..4],
      board[3][2..5],
      board[3][3..6],
      board[4][0..3],
      board[4][1..4],
      board[4][2..5],
      board[4][3..6],
      board[5][0..3],
      board[5][1..4],
      board[5][2..5],
      board[5][3..6],
    ]
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

  
  def line_four?
    case 
    when self.board.any? {|row| row[0..3].uniq.length == 1}
      true
    when self.board.any? {|row| row[1..4].uniq.length == 1}
      true
    when self.board.any? {|row| row[2..5].uniq.length == 1}
      true
    when self.board.any? {|row| row[3..6].uniq.length == 1}
      true
    else
      false
    end

  end

end

b = Board.new
i = 3
1.times do
b.board[0][i] = b.player_w
i += 1
end
b.print_board
puts b.line_four?
# b.cell_select
# p b.board[0][0..3].uniq.length
# p b.board[0][0..3].length