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

  describe '#win_check' do
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    it 'checks for every winning combination' do
      win_combos.map do |combo|
        p tictactoe.current_player.to_s + ', ' + combo.to_s

        test_board.board_reset
        test_board.player_board[combo[0]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[1]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[2]] = tictactoe.current_player[:symbol]

        expect(tictactoe.win_check).to eql(true)
      end

      tictactoe.switch_player

      win_combos.map do |combo|
        p tictactoe.current_player.to_s + ', ' + combo.to_s

        test_board.board_reset
        test_board.player_board[combo[0]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[1]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[2]] = tictactoe.current_player[:symbol]

        expect(tictactoe.win_check).to eql(true)
      end
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
