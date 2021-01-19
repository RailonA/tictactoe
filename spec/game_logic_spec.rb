require './lib/board_info'
require './lib/player_info'
require './lib/game_logic'

describe TicTacToe do
  let(:test_player) { PlayerInfo.new }
  let(:test_board) { BoardInfo.new }
  let(:tictactoe) { TicTacToe.new(test_board, test_player) }

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

    it 'returns nil if error input' do
      tictactoe.error_input = true
      expect(tictactoe.switch_player).to eql(nil)
    end
  end

  describe '#board_update' do
    it 'checks for updated board' do
      tictactoe.location = 2
      tictactoe.current_player = test_player.player[0]
      tictactoe.board_update
      expect(test_board.memory[tictactoe.location - 1]).to eql(' ')
    end
  it  'checks for updated player board' do
     tictactoe.location = 2
     tictactoe.current_player = test_player.player[0]
     tictactoe.board_update
     expect(test_board.player_board[tictactoe.location - 1]).to eql(tictactoe.current_player[:symbol])
  end
    it 'returns nil if error input' do
      tictactoe.error_input = true
      expect(tictactoe.board_update).to eql(nil)
    end
  end

  describe '#win_check' do
    let(:win_combos) { [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }

    it 'checks for every winning combination' do
      tictactoe.switch_player

      win_combos.map do |combo|
        test_board.board_reset
        test_board.player_board[combo[0]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[1]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[2]] = tictactoe.current_player[:symbol]

        expect(tictactoe.win_check).to eql(true)
      end

      tictactoe.switch_player

      win_combos.map do |combo|
        test_board.board_reset
        test_board.player_board[combo[0]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[1]] = tictactoe.current_player[:symbol]
        test_board.player_board[combo[2]] = tictactoe.current_player[:symbol]

        expect(tictactoe.win_check).to eql(true)
      end
    end
  end


describe BoardInfo do
  describe '#board_initialize' do
    let(:test_board) { BoardInfo.new }
    it 'checks that every number is in place' do
      test_board.memory.each_with_index.map { |item, index| expect(item).to eql(index + 1) }
      test_board.player_board.map { |item| expect(item).to eql(' ') }
    end
  end
end
end
