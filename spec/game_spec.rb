require_relative "../lib/game"
require_relative "../lib/players"
require_relative "../lib/gameboard"

describe Game do
    describe "#create_players" do 
    subject(:game) {described_class.new}

    context "Creates an array of players" do 
        it "creates two players" do 
            game.create_players
            expect(game.player_list.length).to eql(2)
        end
    end
end

    describe "#player_turn" do
    subject(:game) {described_class.new}
    context "picks the correct player turn" do 
    it "picks the first player when it's there turn" do 
        board = double("Board", :board => [0,"a","a","a","b","b",6,7,8])
        player_one = double('player')
        player_two = double('player')
        allow(player_one).to receive(:player_icon) { 'a' }
        allow(player_two).to receive(:player_icon) { 'b' }
        game.instance_variable_set(:@player_list, [player_one, player_two])
        game.instance_variable_set(:@board, board)
        selected_player = game.player_turn
        expect(selected_player).to eql(1)

    end

    it "picks the second player when it's there turn" do
        board = double("Board", :board => [0,"b","a","b","b",5,6,7,8])
        player_one = double('player')
        player_two = double('player')
        allow(player_one).to receive(:player_icon) { 'a' }
        allow(player_two).to receive(:player_icon) { 'b' }
        game.instance_variable_set(:@player_list, [player_one, player_two])
        game.instance_variable_set(:@board,board )
        selected_player = game.player_turn
        expect(selected_player).to eql(0)
    end
end
end

end