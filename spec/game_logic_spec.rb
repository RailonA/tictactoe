
require './lib/board_info.rb'
require './lib/player_info.rb'
require './lib/game_logic.rb'

# Test Cases
test_player = PlayerInfo.new
test_board = BoardInfo.new
tictactoe = TicTacToe.new(test_board, test_player)

puts test_player
puts test_board
puts tictactoe

describe TicTacToe do 

  describe '#initialize' do
    test_player.player[0][:name] = ""
    it 'Check for valid creation cases' do
      expect(test_player).to eql(tictactoe.player)
      expect(test_board).to eql(tictactoe.board)
    end
    it 'Check for valid creation cases' do
        expect(test_player.player[0][:name]).to eql("")
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
   

        describe '#board_input' do
            it 'checks if board had been built' do 
            expect(test_board ).to eql()
              tictactoe.switch_player
              expect().to eql()
              tictactoe.switch_player
              expect().to eql()
            end
     end

end

