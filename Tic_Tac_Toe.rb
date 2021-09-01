puts "Welcome to Tic Tac Toe! 
First your going to enter in your letter character that you want to use"

class Playerone

    def initialize (choice)
        @choice = choice

    end

    def valid_name (player_icon)
        while ("a".."z").include?(player_icon) || ("A".."Z").include?(player_icon) == false do
            puts "invalid icon! enter a single letter. Upper or lowercase"
        end

end

player_one = Playerone.new(choice)

puts player_one