require_relative '../lib/players'

describe Players do
    describe "#verify_input" do
    subject(:players) {described_class.new}

    context "assigns the player symbol" do
       before do
        allow(players).to receive(:verify_player).and_return("a")
       end
        it "gives player one the correct symbol" do 
            players.assign_player_one
            expect(players.player_one).to eql("a")
        end
    end

    context "assigns the second player symbol" do
    before do
        allow(players).to receive(:verify_player).and_return("b")
    end
        it "gives player two the correct symbol" do
            players.assign_player_two
            expect(players.player_two).to eql("b")
        end
end
    context "tests the random gets method" do
        before do 
            allow(players).to receive(:gets).and_return('10')
        end
        it "reads the chomp value" do 
        result = players.random
        expect(result).to eql(10)
        end
    end
end 
end