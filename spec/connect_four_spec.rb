require "./lib/connect_four"

describe Board do

  # describe "#cell_select" do
  #   xit "return an integer between 0 and 43" do
  #   board = Board.new
  #   expect(board.cell_select).to eql(5)
  #   end
  # end

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

end