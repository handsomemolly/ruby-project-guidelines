require_relative 'team.rb'
require_relative 'match.rb'
require_relative 'arena.rb'


class Menu

    def start
        puts 'Hello, we hope you are able to read this'
        puts 'Type "t" to see a list of teams'
        puts 'Type "stats" to see statistics for the Premier League'
        puts 'Or type the name of your favorite team'
        user_input = STDIN.gets.chomp
        self.input(user_input)
    end

    def input(user_input)
        if user_input == 't'
            puts Team.all.name
            puts 'Type "stats" to see statistics for the Premier League'
            puts 'Or type the name of your favorite team'
        elsif Team.all.name.include("#{user_input}")
            puts "Home goals: " + (Team.all.find_by(name: "#{user_input}").home_goals).to_s 

            puts "Type 'back' to go back to the main menu"
            user_input = STDIN.gets.chomp
            self.input(user_input)

        elsif user_input == 'stats'
            more stats
        elsif user_input == 'back'
            start
        else
            puts "Invalid input. Please enter t to see a list of teams or type the name of your team"
        end

    end



end