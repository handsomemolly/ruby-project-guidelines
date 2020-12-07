class Arena < ActiveRecord::Base
    has_many :matches
    has_many :teams, through: :matches

    def teams_played_here
        matches_here = Match.all.select{|m| m.arena_id == self.id}
        teams_here = matches_here.map{|m| m.away_team_id}
        teams_here.each do |t|    
            Team.find_by(id: t)
        end
    end

end
