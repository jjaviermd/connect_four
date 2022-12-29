require_relative "connect_four"

game =  Board.new

puts "White tokkens play first"

game.print_board

until game.line_four? do
  tokken = game.cell_select
  game.make_move(tokken)
  game.print_board
  game.game_over if game.line_four?
  game.add_turns
  game.to_played_boxes(tokken)
  game.switch_player
end


