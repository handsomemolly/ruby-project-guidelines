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

    def all_matches
        self.home_matches + self.away_matches
    end

    def goals_per_game
        ((self.home_goals + self.away_goals).to_f / self.all_matches.length.to_f).round(2)
    end

    def win_percentage
        ((self.total_wins.to_f / self.all_matches.length.to_f) * 100).round(2)
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

    def away_wins
        
        self.away_matches.select do |m|
             m.away_team_goals > m.home_team_goals
        end
    end

    def total_wins
        self.home_wins.length + self.away_wins.length
    end

    def self.team_with_most_wins
        wins = []
        self.all.each do |w|
            wins.push(w.home_wins + w.away_wins)
        end
        wins.max_by{|w| w.length}.first.home_team
    end


    def away_goals
        self.away_matches.map{|m| m.away_team_goals}.sum 
    end

    def home_goals
        self.away_matches.map{|m| m.home_team_goals}.sum 
    end

    def self.team_with_most_away_wins
        wins = []
        self.all.each do |t|
            wins << t.away_wins
        end
        wins.max_by{|m| m.length}.first.away_team
    end


end


