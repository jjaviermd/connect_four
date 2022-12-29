require "./lib/connect_four"

describe Board do

  describe "#cell_select" do
    it "return an integer between 0 and 42" do
    board = Board.new
    expect(board.cell_select).to eql(5)
    end
  end

  describe "#valid_move?" do 
    it "returns true if arg is not included in played moves" do
      board = Board.new
      expect(board.valid_move?(5)).to eql(true)
    end
    it "return false if arg is already in played moves" do
      board = Board.new
      board.played_boxes.push(1)
      expect(board.valid_move?(1)).to eql(false)
    end
  end

  describe "#line_four?"do
    it "returns false if there is not a line of the same tokken" do
      board = Board.new
      expect(board.line_four?).to eql(false)
    end

    it "returns true if there is a line of the same tokken" do
      board = Board.new
      board.board[2][1] = board.player_b
      board.board[3][1] = board.player_b
      board.board[4][1] = board.player_b
      board.board[5][1] = board.player_b
      expect(board.line_four?).to eql(true)
    end
  end

  

end