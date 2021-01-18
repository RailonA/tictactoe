
require './lib/board_info'
require './lib/player_info'
require './lib/game_logic'

# Test Cases
test_player = PlayerInfo.new
test_board = BoardInfo.new
tictactoe = TicTacToe.new(test_board, test_player)

puts test_player
puts test_board
puts tictactoe

describe TicTacToe do 
  describe '#initialize' do
    it 'Check for valid creation cases' do
      expect(test_player).to eql(tictactoe.player)
      expect(test_board).to eql(tictactoe.board)
    end
  end
end