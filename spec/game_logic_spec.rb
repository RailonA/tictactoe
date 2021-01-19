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
    it "Check for player_info for invalid symbol" do
      expect(test_player.player[0][:symbol]).not_to eql(test_player.player[1][:symbol])
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
          
    it " Check for repeating turnes, or nill" do
      tictactoe.switch_player
      expect(tictactoe.current_player).not_to eql(nil)
      expect(tictactoe.current_player).not_to eql(tictactoe.player.player.last)
      tictactoe.switch_player
      expect(tictactoe.current_player).not_to eql(tictactoe.player.player.first)
    end

    it 'returns nil if error input' do
     tictactoe.error_input = true
     tictactoe.switch_player 
     expect(tictactoe.current_player).to eql(nil)
    end  
    it 'Checking if switch_player switches player if there is an error' do
      tictactoe.error_input = true
      tictactoe.current_player = tictactoe.player.player[0]
      tictactoe.switch_player 
      expect(tictactoe.current_player).not_to eql(tictactoe.player.player[1])
     end

  end

  describe '#board_update' do
    it 'checks for updated board' do
      tictactoe.location = 2
      tictactoe.current_player = test_player.player[0]
      tictactoe.board_update
      expect(test_board.memory[tictactoe.location - 1]).to eql(' ')
    end
    it 'Check for invalid board update' do
      tictactoe.location = 2
      tictactoe.current_player = test_player.player[0]
      tictactoe.board_update
      expect(test_board.memory[tictactoe.location - 1]).not_to eql(3)
    end

    it 'checks for updated player board' do
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
end

describe BoardInfo do
  let(:test_player) { PlayerInfo.new }
  let(:test_board) { BoardInfo.new }
  let(:tictactoe) { TicTacToe.new(test_board, test_player) }

  describe '#board_initialize' do
    it 'checks that every number is in place' do
      test_board.memory.each_with_index.map { |item, index| expect(item).to eql(index + 1) }
      test_board.player_board.map { |item| expect(item).to eql(' ') }
    end
  end

  describe '#board_reset' do
    let(:input_symbols) { ['X', 'O', ' '] }
    it 'Check if the board has been reset' do
      test_board.memory.map! { |_elem| _elem = rand(1..9) }
      test_board.board_reset
      test_board.memory.each_with_index.map { |item, index| expect(item).to eql(index + 1) }
    end
    it 'Check if player_board has been reset ' do
      test_board.player_board.map! { |_item| _item = input_symbols[rand(0..2)] }
      test_board.board_reset
      test_board.player_board.map { |item| expect(item).to eql(' ') }
    end
  end
end

describe PlayerInfo do
  let(:initial_values1) { { name: '', symbol: 'X', score: 0 } }
  let(:initial_values2) { { name: '', symbol: 'O', score: 0 } }
  describe '#initialize' do
    it 'checks that both players have their corresponding parameters' do
      expect(initial_values1).to eql(PlayerInfo.new.player[0])
      expect(initial_values2).to eql(PlayerInfo.new.player[1])
    end
  end
end
