

class Match < ActiveRecord::Base
    belongs_to :arena
    belongs_to :home_team, class_name: "Team"
    belongs_to :away_team, class_name: "Team"




    def test
        p "it works!"
    end

end

