require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url1 = URI("https://api-football-v1.p.rapidapi.com/v2/leagues/type/league")
url2 = URI("https://api-football-v1.p.rapidapi.com/v2/topscorers/4")

http = [Net::HTTP.new(url1.host, url1.port), Net::HTTP.new(url2.host, url2.port)]
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = [Net::HTTP::Get.new(url1), Net::HTTP::Get.new(url2)]
request.each {|r| r["x-rapidapi-key"] = '680adbf113mshff91628eec25474p194702jsnd1c76f97e364'}
request.each {|r| r["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'}

response1 = http.request(request[0])
response2 = http.request(request[1])

standings = JSON.parse(response1.read_body)
repeats = standings['api']['leagues'].map {|league| league['name']}
# pp repeats.uniq

players = JSON.parse(response2.read_body)
player_stats = players['api']['topscorers'].map {|player| [player['player_name'], player['goals']['total']]} 
pp player_stats
# pp players









