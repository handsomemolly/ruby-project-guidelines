class Arena < ActiveRecord::Base
    has_many :matches
    has_many :teams, through: :matches

    def matches_here
        Match.all.select{|m| m.arena_id == self.id}    
    end

    def teams_played_here
        self.matches_here.map{|m| m.away_team}
    end

    def goals_scored_here
        away_goals = self.matches_here.map {|m| m.away_team_goals}.sum
        home_goals = self.matches_here.map {|m| m.home_team_goals}.sum
        total_goals = home_goals + away_goals
    end

    def self.arena_with_most_goals
        arenas = []
        goals = []
        Arena.all.each do |a|
            arenas.push(a)
            goals.push(a.goals_scored_here)
        end
        max = goals.max_by{|g| g}
        ind = goals.index(max)
        arenas[ind].name + ': ' + max.to_s
        
    end

end
