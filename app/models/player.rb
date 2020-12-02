class Player < ActiveRecord::Base
    belongs_to :league
    belongs_to :national_team
end