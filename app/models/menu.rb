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

    def get_ranking(user_input)
        url = URI("https://api-football-v1.p.rapidapi.com/v2/leagueTable/2")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '680adbf113mshff91628eec25474p194702jsnd1c76f97e364'
        request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
        response = http.request(request)
        standings = JSON.parse(response.read_body)
        pp standings['api']['standings'][0].select{|t| t['teamName'] == "Liverpool"}.map{|t| t['rank']}.to_s
    end

    def input(user_input)
        if user_input == 't'
            puts Team.all.name
            puts 'Type "stats" to see statistics for the Premier League'
            puts 'Or type the name of your favorite team'
        elsif Team.all.name.include("#{user_input}")
            puts "Goals per game: " + (Team.all.find_by(name: "#{user_input}").goals_per_game).to_s 
            puts "Win percentage: " + (Team.all.find_by(name: "#{user_input}").win_percentage).to_s
            get_ranking(user_input)

            puts "Type 'back' to go back to the main menu"
            user_input = STDIN.gets.chomp
            self.input(user_input)

        elsif user_input == 'stats'
            puts "Team with most wins: " + Team.team_with_most_wins.name
            puts "Team with most away wins: " + Team.team_with_most_away_wins.name
            puts "Arena with most goals: " + Arena.arena_with_most_goals 

        elsif user_input == 'back'
            start
        else
            puts "Invalid input. Please enter t to see a list of teams or type the name of your team"
        end

        def exit
            puts "Until next time"
        end

    end



end