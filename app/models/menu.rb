class Menu

    def start
        puts 'Hello, we hope you are able to read this'
        puts 'Type "t" to see a list of teams'
        puts 'Type "stats" to see statistics for the Premier League'
        puts 'Or enter the name of your favorite team'
        user_input = STDIN.gets.chomp
        self.input(unser_input)
    end

    def input(user_input)
        if user_input == 't'
            pull list
        elsif Team.all.include("#{user_input}")
            send them to another menu
        else
            puts "Invalid input. Please enter t to see a list of teams or type the name of your team"
        end

    end



end