require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url1 = URI("https://api-football-v1.p.rapidapi.com/v2/leagues/type/league")
url2

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = '680adbf113mshff91628eec25474p194702jsnd1c76f97e364'
request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'

response = http.request(request)

standings = JSON.parse(response.read_body)
repeats = standings['api']['leagues'].map {|league| league['name']}
pp repeats.uniq







