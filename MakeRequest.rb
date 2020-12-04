require 'uri'
require 'net/http'
require 'openssl'
require 'json'

urls = [
    URI("https://api-football-v1.p.rapidapi.com/v2/leagues/type/league"),
    URI("https://api-football-v1.p.rapidapi.com/v2/topscorers/4"),
    URI("https://api-football-v1.p.rapidapi.com/v2/teams/league/4")
]

http = []
count = 0
urls.each do |url|
    http.push(Net::HTTP.new(urls[count].host, urls[count].port))
    count += 1
end

# http = [Net::HTTP.new(url1.host, url1.port), , Net::HTTP.new(url2.host, url2.port), Net::HTTP.new(url3.host, url3.port)]
http.each {|h| h.use_ssl = true}
# http.use_ssl = true
http.each {|h| h.verify_mode = OpenSSL::SSL::VERIFY_NONE}
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

requests = []
count = 0
http.each do |h|
    requests.push(Net::HTTP::Get.new(urls[count]))
    count += 1
end

# request = [Net::HTTP::Get.new(url1), Net::HTTP::Get.new(url2), Net::HTTP::Get.new(url3)]
requests.each {|r| r["x-rapidapi-key"] = '680adbf113mshff91628eec25474p194702jsnd1c76f97e364'}
requests.each {|r| r["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'}

responses = []
count = 0
http.each do |h|
    responses.push(http[count].request(requests[count]))
    count += 1
end

# response1 = http[0].request(requests[0])
# response2 = http[1].request(requests[1])
# response3 = http[2].request(requests[2])

standings = JSON.parse(responses[0].read_body)
repeats = standings['api']['leagues'].map {|league| league['name']}
pp repeats.uniq

players = JSON.parse(responses[1].read_body)
player_stats = players['api']['topscorers'].map {|player| [player['player_name'], player['goals']['total'], player['team_name']]} 
pp player_stats
# pp players









