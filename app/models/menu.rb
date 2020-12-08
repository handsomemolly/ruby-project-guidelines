require_relative 'team.rb'
require_relative 'match.rb'
require_relative 'arena.rb'
    

    def start
        welcome
        user_input = get_input
        until user_input == "exit"
            case user_input
            when "t" then
                puts Team.all.map{|t| t.name}
                user_input = get_input
            when "stats" then
                get_league_stats
                user_input = get_input
            when "options" then
                options
                user_input = get_input
            else 
                if Team.all.map{|t| t.name}.include?(user_input)
                    get_team_stats(user_input)
                    get_ranking(user_input)
                    start
                end
                puts "Invalid command, please try again"
                user_input = get_input
            end
        end
        exit
    end
    def options
        puts 'Type "t" to see a list of teams'
        puts 'Type "stats" to see statistics for the Premier League'
        puts 'Type the name of your favorite team in the list'
        puts 'Type "exit" to leave'
    end
    def get_input
        puts 'Please enter a command'
        STDIN.gets.chomp
    end
    def get_team
        puts 'Please enter a team name'
        team = STDIN.gets.chomp
        until Team.all.map{|t| t.name}.include?(team)
            puts 'Please enter the name of a team in the Premier League'
            team = STDIN.gets.chomp
        end
        team
    end
    def get_team_stats(user_input)
        puts "Goals per game: " + "#{(Team.all.find_by(name: "#{user_input}").goals_per_game).to_s}" 
        puts "Win percentage: " + "#{(Team.all.find_by(name: "#{user_input}").win_percentage).to_s}"
    end
    def get_league_stats
        puts "Team with most wins: " + "#{Team.team_with_most_wins.name}"
        puts "Team with most away wins: " + "#{Team.team_with_most_away_wins.name}"
        puts "Arena with most goals: " + Arena.arena_with_most_goals
    end
    def get_ranking(team)
        url = URI("https://api-football-v1.p.rapidapi.com/v2/leagueTable/2")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '680adbf113mshff91628eec25474p194702jsnd1c76f97e364'
        request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
        response = http.request(request)
        standings = JSON.parse(response.read_body)
        pp "Ranking: " + standings['api']['standings'][0].select{|t| t['teamName'] == "Liverpool"}.map{|t| t['rank']}.to_s
    end
    def welcome
        puts "Use this app to see stats on the Premier League"
        puts 'type "options" to see valid commands'
    end