class Team < ActiveRecord::Base
    has_many :matches
    has_many :arenas, through: :matches
    has_many :home_teams, foreign_key: :home_team_id, class_name: "Match"
    has_many :arenas, through: :home_teams
    has_many :away_teams, foreign_key: :away_team_id, class_name: "Match"
    has_many :arenas, through: :away_teams


    def home_matches
        Match.all.select{|m| m.home_team_id == self.id}
    end

    def away_matches
        Match.all.select{|m| m.away_team_id == self.id}
    end

    def home_arena
        a = self.home_matches.map{|m| m.arena_id}.uniq
        Arena.find_by(id: a).name
    end

    def home_wins
        
        self.home_matches.select do |m|
             m.home_team_goals > m.away_team_goals
        end
    end

    def away_goals
        self.away_matches.map{|m| m.away_team_goals}.sum 
    end

    def home_goals
        self.away_matches.map{|m| m.home_team_goals}.sum 
    end

end


