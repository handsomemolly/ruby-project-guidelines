class CreateMatches < ActiveRecord::Migration[5.0]
    def change
        create_table :matches do |t|
            t.datetime :date
            t.integer :home_team_id
            t.integer :away_team_id
            t.integer :home_team_goals
            t.integer :away_team_goals
            t.integer :stadium_id
        end

    end

end
