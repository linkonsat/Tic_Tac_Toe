require_relative '../lib/players'

describe Players do
    describe "#verify_input" do
    subject(:players) {described_class.new}

    context "assigns the player symbol" do
       before do
        allow(players).to receive(:verify_player).and_return("a")
       end
        it "gives player the correct symbol" do 
            players.assign_player
            expect(players.player_icon).to eql("a")
        end
    end

    context "tests the random gets method" do
        before do 
            allow(players).to receive(:gets).and_return('b')
        end
        it "reads the chomp value" do 
        result = players.verify_player
        expect(result).to eql('b')
        end
    end
end 
end