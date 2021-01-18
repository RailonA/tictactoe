require './lib/board_info.rb'
require './lib/player_info.rb'
require './lib/game_logic.rb'

describe TicTacToe do
  test_player = PlayerInfo.new
  test_board = BoardInfo.new
  tictactoe = TicTacToe.new(test_board, test_player)

  describe '#initialize' do
    it 'Check for valid creation cases' do
      expect(test_player).to eql(tictactoe.player)
      expect(test_board).to eql(tictactoe.board)
    end
  end

  describe '#switch_player' do
    it 'checks if players have been switched' do
      expect(tictactoe.current_player).to eql(nil)
      tictactoe.switch_player
      expect(tictactoe.current_player).to eql(tictactoe.player.player.first)
      tictactoe.switch_player
      expect(tictactoe.current_player).to eql(tictactoe.player.player.last)
    end
  end
end

describe BoardInfo do
  describe '#board_initialize' do
    this_test_board = BoardInfo.new
    it 'checks that every number is in place' do
      this_test_board.memory.each_with_index.map { |item, index| expect(item).to eql(index + 1) }
      this_test_board.player_board.map { |item| expect(item).to eql(' ') }
    end
  end
end
