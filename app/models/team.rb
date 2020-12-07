class Team < ActiveRecord::Base
    has_many :matches
    has_many :arenas, through: :matches

    def home_matches
        Match.all.select{|m| m.home_team_id == self.id}
    end

    def away_matches
        Match.all.select{|m| m.home_away_id == self.id}
    end

    def home_arena
        a = self.home_matches.map{|m| m.arena_id}.uniq
        Arena.find_by(id: a).name
    end

end


