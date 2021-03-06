require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class MakeRequest < ActiveRecord::Base

  
    @@urls = [
        # URI("https://api-football-v1.p.rapidapi.com/v2/topscorers/2"), #scorers in Premier League
        URI("https://api-football-v1.p.rapidapi.com/v2/teams/league/2"), #teams in Premier League
        URI("https://api-football-v1.p.rapidapi.com/v2/leagueTable/2"), #team standings in Premier League
        URI("https://api-football-v1.p.rapidapi.com/v2/fixtures/league/2?timezone=Europe%2FLondon") #fixtures in Premier League
    ]
    @@http = []
    @@urls.each do |url|
        h = Net::HTTP.new(url.host, url.port)
        h.use_ssl = true
        h.verify_mode = OpenSSL::SSL::VERIFY_NONE
        @@http.push(h)
    end

    @@requests = []
    @@urls.each do |url|
        r = Net::HTTP::Get.new(url)
        r["x-rapidapi-key"] = '680adbf113mshff91628eec25474p194702jsnd1c76f97e364'
        r["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
        @@requests.push(r)
    end

    @@responses = []
    count = 0
    @@http.each do |h|
        @@responses.push(h.request(@@requests[count]))
        count += 1
    end


    def self.populate_match
        matches = JSON.parse(@@responses[1].read_body)['api']['fixtures']
        #match_filtered = match['api']['fixtures'].map{|m|  [m['event_date'], m['homeTeam']['team_name'], m['awayTeam']['team_name'], m['goalsHomeTeam'], m['goalsAwayTeam'], m['venue']]}
        matches.each do |m|
            home_id = Team.find_by(name: m['homeTeam']['team_name'])
            away_id = Team.find_by(name: m['awayTeam']['team_name'])
            arena_id = Arena.find_by(name: m["venue"])

            if home_id && away_id && arena_id
                Match.create(date: m['event_date'], home_team_id: home_id.id, away_team_id: away_id.id, 
                home_team_goals: m["goalsHomeTeam"], away_team_goals: m['goalsAwayTeam'], arena_id: arena_id.id)
            end
        end
    end

    def self.populate_team
        team = JSON.parse(@@responses[0].read_body)
        team_filtered = team['api']['teams'].map{|m| m['name']}
        team_filtered.each do |t|
            Team.create(name: t)
        end
    end



    def self.populate_arena
        team = JSON.parse(@@responses[0].read_body)
        arena = team['api']['teams'].map{|m| m['venue_name']}
        arena.each do |a|
            Arena.create(name: a)
        end
    end


    def self.rank
        standings = JSON.parse(@@responses[1].read_body)
        pp standings['api']['standings'][0].select{|t| t['teamName'] == "Liverpool"}.map{|t| t['rank']}.to_s
    end

    def self.test
        puts "I work"
    end

end 


#   def populateCharity(url)
#     parsed = populateHelper(url)
#     parsed.each do |charity|
#       Charity.create(ein: charity["ein"], name: charity["charityName"], category: charity["category"],
#         state: charity["state"], accepting_donations: charity["acceptingDonations"])
#     end
#   end

# end


# repeats = standings['api']['leagues'].map {|league| league['name']}
# #pp repeats.uniq
# players = JSON.parse(responses[1].read_body)
# player_stats = players['api']['topscorers'].map {|player| [player['player_name'], player['goals']['total'], player['team_name'], player['nationality']]} 
# #pp player_stats
# # pp players
# # teams = JSON.parse(responses[2].read_body)
# # pp teams
# champs = JSON.parse(responses[3].read_body)
# #pp champs['api']['standings'][0].map {|team| [team['teamName'], team['description'] ]}
# national_teams = JSON.parse(responses[4].read_body)


