require "./lib/connect_four"
describe Board do
  describe "#print_board" do
    it "prints the layout board game" do
      board = Board.new
      expect(board.print_board).to eql()
    end
  end
end