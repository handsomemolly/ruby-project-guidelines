<<<<<<< HEAD
# require 'make_request.rb'

class Match < ActiveRecord::Base
    belongs_to :arena
    belongs_to :teams

    def home_team_goals
        pp match['api']['fixtures'].map{|m|m['goalsHomeTeam']}
    end

    def test
        p "it works!"
    end

end
=======
class Match < ActiveRecord::Base
    belongs_to :stadium
    belongs_to :team

    def self.tester
        puts 'lol'
    end

end

>>>>>>> 616085ca262f061dd861c34677135b8e21050369
